import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student/main.dart';
import 'menu.dart';
import 'login.dart';

var email;
var name;
var rollNumber;
var roomNumber;
var personalContactNumber;
var parentsContactNumber;
var mentorname;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  State<ProfilePage> createState() => _ProfilePageState(profile_map: map);
}

class _ProfilePageState extends State<ProfilePage> {
  _ProfilePageState({Key? key, required this.profile_map});
  final Map<String, dynamic> profile_map;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 18,
    fontFamily: 'openSans-medium',
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.blue[50],
            child: SizedBox(
              width: 330,
              height: 600,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey.shade200,
                      radius: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-vector/boy-with-dental-braces-dental-care-little-boy-portrait-circular-frame_254685-951.jpg?w=740'),
                        radius: 75,
                        backgroundColor: Colors.white54,
                      ), //CircleAvatar
                    ), //CircleAvatar
                    SizedBox(
                      height: 35,
                    ), //SizedBox
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            'Name : ',
                            style: optionStyle, //Textstyle
                          ),
                          Text(
                            '${profile_map['user']['Name']}',
                            style: optionStyle, //Textstyle
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            'Roll Number : ',
                            style: optionStyle, //Textstyle
                          ),
                          Text(
                            '${profile_map['user']['RollNumber']}',
                            style: optionStyle, //Textstyle
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            'Room Number : ',
                            style: optionStyle, //Textstyle
                          ),
                          Text(
                            '${profile_map['user']['RoomNumber']}',
                            style: optionStyle, //Textstyle
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            'Email : ',
                            style: optionStyle, //Textstyle
                          ),
                          Text(
                            '${profile_map['user']['EmailId']}',
                            style: optionStyle, //Textstyle
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            'Personal Number : ',
                            style: optionStyle, //Textstyle
                          ),
                          Text(
                            '${profile_map['user']['PersonalContactNumber']}',
                            style: optionStyle, //Textstyle
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            'Parents Number : ',
                            style: optionStyle, //Textstyle
                          ),
                          Text(
                            '${profile_map['user']['ParentsContactNumber']}',
                            style: optionStyle, //Textstyle
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            'Mentor : ',
                            style: optionStyle, //Textstyle
                          ),
                          Text(
                            '${profile_map['user']['MentorName']}',
                            style: optionStyle, //Textstyle
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     eraseData();
                    //     Navigator.of(context).pushAndRemoveUntil(
                    //         MaterialPageRoute(
                    //       builder: (_) {
                    //         return Student();
                    //       },
                    //     ), (route) => false);
                    //   },
                    //   child: Text("Logout", style: TextStyle(fontSize: 18)),
                    //   style: ElevatedButton.styleFrom(
                    //       fixedSize: const Size(300, 50),
                    //       primary: Color.fromRGBO(88, 101, 242, 1)),
                    // ),
                    Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          eraseData();
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (_) {
                              return Login();
                            },
                          ));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(100.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Logout",
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
          ),
        ),
      ),
    );
  }

  Future<void> eraseData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
