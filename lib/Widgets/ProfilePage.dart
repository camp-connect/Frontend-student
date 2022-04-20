import 'package:flutter/material.dart';
import 'package:student/main.dart';

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
            color: Colors.blueGrey.shade100,
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
                            'https://cdn.pixabay.com/photo/2017/01/31/21/23/avatar-2027365_1280.png'),
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) {
                            return Student();
                          },
                        ));
                      },
                      child: Text("Logout", style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50),
                          primary: Color.fromRGBO(88, 101, 242, 1)),
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
}
