import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:student/Widgets/config.dart';
import 'package:student/Widgets/thankyou.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:motion_toast/motion_toast.dart';

class GatePassRequest extends StatefulWidget {
  final Map<String, dynamic> map;
  const GatePassRequest({Key? key, required this.map}) : super(key: key);

  @override
  State<GatePassRequest> createState() => _GatePassRequestState(gate_map: map);
}

class _GatePassRequestState extends State<GatePassRequest> {
  final Map<String, dynamic> gate_map;
  _GatePassRequestState({Key? key, required this.gate_map});

  TimeOfDay? out_time = const TimeOfDay(hour: 12, minute: 12);
  DateTime out_date = DateTime(2022, 04, 20);
  TimeOfDay? in_time = const TimeOfDay(hour: 12, minute: 12);
  var gate_pass_Controller = TextEditingController();
  final _formKey_gatepass = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.pink[100],
        elevation: 0,
        title: Text(
          "Request For Gate Pass",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, top: 25, right: 10),
        child: ListView(children: [
          Container(
            margin: EdgeInsets.only(left: 120),
            child: Text(
              "Purpose",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 500,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.pink[10],
              elevation: 10,
              child: Form(
                key: _formKey_gatepass,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 320,
                      margin: EdgeInsets.only(left: 20),
                      child: TextFormField(
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
                        controller: gate_pass_Controller,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          filled: true,
                          hintText: 'Write Your Purpose clearly!',
                          fillColor: Colors.blue.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Out Time:- ${out_time!.hour.toString()}:${out_time!.minute.toString()}',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 60),
                        FloatingActionButton(
                          child: const Icon(
                            Icons.access_time_outlined,
                          ),
                          onPressed: () async {
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: out_time!,
                            );
                            if (newTime != null) {
                              setState(() {
                                out_time = newTime;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Out Date:- ${out_date!.day}/${out_date!.month}/${out_date!.year}",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FloatingActionButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: out_date,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (newDate == null) return;
                              setState(() {
                                out_date = newDate;
                              });
                            },
                            child: const Icon(Icons.date_range))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'In Time:- ${in_time!.hour.toString()}:${in_time!.minute.toString()}',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 75),
                        FloatingActionButton(
                          child: const Icon(
                            Icons.access_time_outlined,
                          ),
                          onPressed: () async {
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: in_time!,
                            );
                            if (newTime != null) {
                              setState(() {
                                in_time = newTime;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     Text(
                    //       "In Date:- ${in_date!.day}/${in_date!.month}/${in_date!.year}",
                    //       style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    //     ),
                    //     SizedBox(
                    //       width: 30,
                    //     ),
                    //     FloatingActionButton(
                    //         onPressed: () async {
                    //           DateTime? newDate = await showDatePicker(
                    //             context: context,
                    //             initialDate: in_date,
                    //             firstDate: DateTime(2000),
                    //             lastDate: DateTime(2100),
                    //           );
                    //           if (newDate == null) return;
                    //           setState(() {
                    //             in_date = newDate;
                    //           });
                    //         },
                    //         child: const Icon(Icons.date_range))
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 70,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     if (!_formKey_gatepass.currentState!.validate()) {
                    //       // ScaffoldMessenger.of(context).showSnackBar(
                    //       //   const SnackBar(
                    //       //       content: Text('Fill Complete Form')),
                    //       // );
                    //       MotionToast.error(
                    //               title: Text("Error"),
                    //               description:
                    //                   Text("Please Mention Complain Clearly!"))
                    //           .show(context);
                    //     } else
                    //       submit(context);
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (_) {
                    //         return ThanksPage(map: gate_map);
                    //       },
                    //     ));
                    //   },
                    //   child: Text("Submit"),
                    //   style: ElevatedButton.styleFrom(
                    //       fixedSize: const Size(340, 50), primary: Colors.blue),
                    // ),
                    Center(
                      child: Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            if (!_formKey_gatepass.currentState!.validate()) {
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
                              submit(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) {
                                  return ThanksPage(map: gate_map);
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> submit(context) async {
    String uri = Config.server;
    String path = '/campconnectadminapi/outPassRequestByStudent.php';
    Map<String, String> headers = {"Access-Control-Allow-Origin": "*"};
    Map<String, String> body = {
      'Name': gate_map['user']['Name'],
      'EmailId': gate_map['user']['EmailId'],
      'Purpose': '${gate_pass_Controller.text}',
      'OutTime':
          '${out_time!.hour.toString()}:${out_time!.minute.toString()}:00',
      'InTime': '${in_time!.hour.toString()}:${in_time!.minute.toString()}:00',
      'OutDate': '${out_date!.year}/${out_date!.month}/${out_date!.day}',
      'ParentsPermission': 'Yes',
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
