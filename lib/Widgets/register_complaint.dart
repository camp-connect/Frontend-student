import 'package:flutter/material.dart';
import 'package:student/Widgets/thankyou.dart';
import 'config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:motion_toast/motion_toast.dart';

class RegisterComplaint extends StatefulWidget {
  final Map<String, dynamic> map;
  const RegisterComplaint({Key? key, required this.map}) : super(key: key);

  @override
  State<RegisterComplaint> createState() =>
      _RegisterComplaintState(complaint_map: map);
}

class _RegisterComplaintState extends State<RegisterComplaint> {
  _RegisterComplaintState({Key? key, required this.complaint_map});
  final Map<String, dynamic> complaint_map;
  var complaintController = TextEditingController();
  final _formKey_complain = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.pink[50],
        elevation: 0,
        title: Text(
          "Register Complain",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 500,
        margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.pink[10],
            elevation: 10,
            child: ListView(
              children: <Widget>[
                Form(
                  key: _formKey_complain,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Name:- ${complaint_map['user']['Name']}",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Roll Number:- ${complaint_map['user']['RollNumber']}",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Room Number:-  ${complaint_map['user']['RoomNumber']}",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Personal Number:-  ${complaint_map['user']['PersonalContactNumber']}",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: 320,
                          margin: EdgeInsets.all(0),
                          child: TextFormField(
                            controller: complaintController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Specify Reason';
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            minLines: 1,
                            maxLines: 5,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontSize: 20,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              filled: true,
                              labelText: 'Complain',
                              hintText: 'Write Your Complain clearly!',
                              fillColor: Colors.blue.shade100,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     if (!_formKey_complain.currentState!.validate()) {
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(
                        //             content: Text('Please Specify Reason')),
                        //       );
                        //     } else {
                        //       submitComplain(context);
                        //       Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (_) {
                        //           return ThanksPage(
                        //             map: complaint_map,
                        //           );
                        //         },
                        //       ));
                        //     }
                        //   },
                        //   child: Text("Submit"),
                        //   style: ElevatedButton.styleFrom(
                        //       fixedSize: const Size(300, 50),
                        //       primary: Color.fromRGBO(88, 101, 242, 1)),
                        // ),
                        Container(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              if (!_formKey_complain.currentState!.validate()) {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //       content: Text('Fill Complete Form')),
                                // );
                                MotionToast.error(
                                        title: Text("Error"),
                                        description: Text(
                                            "Please Mention Complain Clearly!"))
                                    .show(context);
                              } else {
                                submitComplain(context);
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) {
                                    return ThanksPage(map: complaint_map);
                                  },
                                ));
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff374ABE),
                                      Color(0xff64B6FF)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Submit",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submitComplain(context) async {
    String uri = Config.server;
    String path = '/campconnectadminapi/complainRegistration.php';
    Map<String, String> headers = {"Access-Control-Allow-Origin": "*"};
    Map<String, String> body = {
      'Name': complaint_map['user']['Name'],
      'EmailId': complaint_map['user']['EmailId'],
      'RoomNumber': complaint_map['user']['RoomNumber'],
      "PersonalContactNumber": complaint_map['user']['PersonalContactNumber'],
      "JustifiedIssue": complaintController.text,
    };

    // try {
    final response =
        await http.post(Uri.http(uri, path), headers: headers, body: body);
    print(response.body.toString());
    final String str = jsonEncode(await response.body.toString());
    final decodedjson = jsonDecode(str);
    Map<String, dynamic> map = jsonDecode(decodedjson);
    print(map);
  }
}
