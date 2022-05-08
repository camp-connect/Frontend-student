// import 'dart:js_util';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student/Widgets/config.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:student/Widgets/menu.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  var emailController = TextEditingController();

  var passController = TextEditingController();

  final _formKey_login = GlobalKey<FormState>();

  late SharedPreferences logindata;
  late bool newuser;
  late Map<String, dynamic> map;

  bool _pisObscure = true;
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

      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) =>
                Menu(name: newmap['user']['Name'], map: newmap)),
      );
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    logindata.setBool('login', true);
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Login as Student",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        body: Form(
          key: _formKey_login,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Welcome back!",
                      style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: Text(
                      "We\'re so excited to see you again!",
                      style: TextStyle(
                        color: Color.fromRGBO(148, 152, 158, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 14, right: 14),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email required !';
                          } else if (!value.contains('@jklu.edu.in')) {
                            return 'Enter your institutional email id';
                          }
                          return null;
                        },
                        controller: emailController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Educational Email',
                          prefixIcon: Icon(Icons.email),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.black26, width: 2),
                          ),
                          labelText: 'Email',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 14, right: 14),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 3),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        obscureText: _pisObscure,
                        autocorrect: false,
                        controller: passController,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          prefixIcon: Icon(Icons.password),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.black26, width: 2),
                          ),
                          labelText: 'Password',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _pisObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _pisObscure = !_pisObscure;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: TextButton(
                      onPressed: () {
                        MotionToast.info(
                                title: Text("Forgot your password?"),
                                description:
                                    Text("Feature will be soon implemented"))
                            .show(context);
                      },
                      child: Text("Forgot your password?"),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 17),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("* Note: Login After Admin Approval Only",
                          style: TextStyle(color: Colors.red)),
                    ),
                    transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                  ),
                  // Center(
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (_) {
                  //           return Menu();
                  //         },
                  //       ));
                  //     },
                  //     child: Text("Login"),
                  //     style: ElevatedButton.styleFrom(
                  //         fixedSize: const Size(340, 50),
                  //         primary: Color.fromRGBO(88, 101, 242, 1)),
                  //   ),
                  // )
                  // Container(
                  //   height: 40.0,
                  //   child: Center(
                  //     child: RaisedButton(
                  //       onPressed: () {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (_) {
                  //             return Menu(name: "Aditya Shukla");
                  //           },
                  //         ));
                  //       },
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(80.0)),
                  //       padding: EdgeInsets.all(0.0),
                  //       child: Ink(
                  //         decoration: BoxDecoration(
                  //             gradient: LinearGradient(
                  //               colors: [Colors.pinkAccent, Color(0xff64B6FF)],
                  //               begin: Alignment.centerLeft,
                  //               end: Alignment.centerRight,
                  //             ),
                  //             borderRadius: BorderRadius.circular(100.0)),
                  //         child: Container(
                  //           constraints:
                  //               BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "Login",
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: 40.0,
                    child: Center(
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey_login.currentState!.validate()) {
                            login();
                          }
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
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    String uri = Config.server;
    String path = '/campconnectadminapi/studentLoginApi.php';
    Map<String, String> headers = {"Access-Control-Allow-Origin": "*"};

    // Map<String, String> body = {
    //   'EmailId': 'iamhunter1@jklu.edu.in',
    //   'Passwords': '1234567'
    // };
    Map<String, String> body = {
      'EmailId': emailController.text,
      'Passwords': passController.text,
    };

    // try {
    final response =
        await http.post(Uri.http(uri, path), headers: headers, body: body);
    print(response.statusCode);

    final String str = jsonEncode(await response.body.toString());
    final decodedjson = jsonDecode(str);
    map = jsonDecode(decodedjson);
    if (response.statusCode == 200) {
      loginHelper();
    }
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return Menu(name: map['user']['Name'], map: map);
    // }));
    print(map['user']['Name']);
    print(map['user']);
    print(map['message']);
  }

  Future<void> loginHelper() async {
    String username = emailController.text;
    String password = passController.text;

    if (username != '' && password != '') {
      print('Successfull');

      logindata.setBool('login', false);
      logindata.setString('username', username);
      logindata.setString('password', password);
      if (map['error'] == 200) {
        String encodeMap = json.encode(map);
        print(encodeMap);
        logindata.setString('profileData', encodeMap);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) {
            return Menu(name: map['user']['Name'], map: map);
          }),
        );
      } else {
        MotionToast.warning(
                title: Text("Login Warning"),
                description: Text("Invalid Credentials or user not approved"))
            .show(context);
      }
    }
  }
}
