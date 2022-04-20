import 'package:flutter/material.dart';
import 'package:student/Widgets/thankyou.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Register Complain",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 80, 0, 0),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Name:- ${complaint_map['user']['Name']}",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Roll Number:- ${complaint_map['user']['RollNumber']}",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Room Number:-  ${complaint_map['user']['RoomNumber']}",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Personal Number:-  ${complaint_map['user']['PersonalContactNumber']}",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 320,
                  margin: EdgeInsets.all(0),
                  child: TextFormField(
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) {
                        return ThanksPage();
                      },
                    ));
                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 50),
                      primary: Color.fromRGBO(88, 101, 242, 1)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
