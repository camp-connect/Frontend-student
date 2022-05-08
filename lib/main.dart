// @dart=2.9

import 'package:flutter/material.dart';
import './Widgets/login.dart';
import './Widgets/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Widgets/menu.dart';
import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Student', initialRoute: '/', home: Splash());
  }
}

class Student extends StatefulWidget {
  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  // SharedPreferences logindata;
  // bool newuser;
  // Map<String, dynamic> map;

  // bool _pisObscure = true;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   check_if_already_login();
  // }

  // void check_if_already_login() async {
  //   logindata = await SharedPreferences.getInstance();
  //   print(logindata.getString('username'));
  //   print(logindata.getString('password'));

  //   newuser = (logindata.getBool('login') ?? true);
  //   print(newuser);

  //   // Map<String, String> body = {
  //   //   'EmailId': 'iamhunter1@jklu.edu.in',
  //   //   'Passwords': '1234567'
  //   // };

  //   if (newuser == false) {
  //     // await login(context);
  //     print("hellp");

  //     String encodeMap = logindata.getString('profileData') ?? "";
  //     print(encodeMap);
  //     Map<String, dynamic> newmap = jsonDecode(encodeMap);
  //     print(newmap);

  //     Navigator.pushReplacement(
  //       context,
  //       new MaterialPageRoute(
  //           builder: (context) =>
  //               Menu(name: newmap['user']['Name'], map: newmap)),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Text("Student Login",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 300,
            width: 400,
            child: const Image(
              image: AssetImage("assets/images/student_login.png"),
            ),
          ),
          Text(
            "Welcome to Campus!",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Let's get connected and \n digitalize the campus!!",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 40.0,
            child: RaisedButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Register()));
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) {
                    return Register();
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
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     // Navigator.push(
          //     //     context, MaterialPageRoute(builder: (context) => Register()));
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (_) {
          //         return Register();
          //       },
          //     ));
          //   },
          //   child: Text("Register"),
          //   style: ElevatedButton.styleFrom(
          //       fixedSize: const Size(300, 40),
          //       primary: Color.fromRGBO(88, 101, 242, 1)),
          // ),
          SizedBox(
            height: 20,
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (_) {
          //         return Login();
          //       },
          //     ));
          //   },
          //   child: Text("Login"),
          //   style: ElevatedButton.styleFrom(
          //       fixedSize: const Size(300, 40), primary: Colors.grey),
          // ),

          Container(
            height: 40.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
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
                      colors: [Colors.pinkAccent, Color(0xff64B6FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(100.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
