import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student/main.dart';
import 'dart:convert';
import 'dart:async';
import 'Widgets/menu.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late SharedPreferences logindata;
  late bool newuser;

  late Map<String, dynamic> map;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    print(logindata.getString('username'));
    print(logindata.getString('password'));

    newuser = (logindata.getBool('login') ?? true);
    print(newuser);

    // Map<String, String> body = {
    //   'EmailId': 'iamhunter1@jklu.edu.in',
    //   'Passwords': '1234567'
    // };

    if (newuser == false) {
      // await login(context);
      print("hellp");

      String encodeMap = logindata.getString('profileData') ?? "";
      print(encodeMap);
      Map<String, dynamic> newmap = jsonDecode(encodeMap);
      print(newmap);
      Timer(
          Duration(seconds: 2),
          () => {
                Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                          Menu(name: newmap['user']['Name'], map: newmap)),
                ),
              });
    } else {
      Timer(
          Duration(seconds: 2),
          () => {
                Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => Student(),
                  ),
                ),
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SpinKitWave(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.blue : Colors.pinkAccent,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
