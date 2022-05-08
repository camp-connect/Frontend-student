import 'package:flutter/material.dart';
import 'package:student/Widgets/config.dart';
import './login.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:flushbar/flushbar.dart';
import 'package:motion_toast/motion_toast.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  var signup_emailController = TextEditingController();

  var signup_passController = TextEditingController();

  var signup_personalContactController = TextEditingController();

  var signup_nameController = TextEditingController();

  var signup_rollController = TextEditingController();

  var signup_roomController = TextEditingController();

  var signup_parentsContactController = TextEditingController();

  var signup_mentorController = TextEditingController();

  bool _pisObscure = true;

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
                "Register as Student",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            body: Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email required !';
                          } else if (!value.contains('@jklu.edu.in')) {
                            return 'Enter your institutional email id';
                          }
                          return null;
                        },
                        controller: signup_emailController,
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
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
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
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: signup_nameController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Name',
                          prefixIcon: Icon(Icons.person),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.black26, width: 2),
                          ),
                          labelText: 'Name',
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password  required !';
                          } else if (value.length < 6) {
                            return 'Password length must be atleast 6 !';
                          }
                          return null;
                        },
                        controller: signup_passController,
                        obscureText: _pisObscure,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.password),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
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

                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter complete roll no.';
                          }
                          return null;
                        },
                        controller: signup_rollController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Roll Number',
                          prefixIcon: Icon(Icons.confirmation_number),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.black26, width: 2),
                          ),
                          labelText: 'Roll Number',
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter room no.';
                          }
                          return null;
                        },
                        controller: signup_roomController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Room Number',
                          prefixIcon: Icon(Icons.hotel),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.black26, width: 2),
                          ),
                          labelText: 'Room Number',
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                        controller: signup_personalContactController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Phone Number',
                          prefixIcon: Icon(Icons.call),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.black26, width: 2),
                          ),
                          labelText: 'Personal Phone Number',
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter parent\'s phone number';
                          }
                          return null;
                        },
                        controller: signup_parentsContactController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Parent\'s Phone Number',
                          prefixIcon: Icon(Icons.phone_android),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.black26, width: 2),
                          ),
                          labelText: 'Parent\'s Phone Number',
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter mentor name';
                          }
                          return null;
                        },
                        controller: signup_mentorController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Mentor Name',
                          prefixIcon: Icon(Icons.person),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.black26, width: 2),
                          ),
                          labelText: 'Mentor',
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
                    SizedBox(
                      height: 10,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (_) {
                    //         return Login();
                    //       },
                    //     ));
                    //   },
                    //   child: Text("Register"),
                    //   style: ElevatedButton.styleFrom(
                    //       fixedSize: const Size(300, 50),
                    //       primary: Color.fromRGBO(88, 101, 242, 1)),
                    // ),
                    Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Fill Complete Form')),
                            );
                            // MotionToast.error(
                            //         title: Text("Fill Complete Form"),
                            //         description:
                            //             Text("All the Fields are mandatory"))
                            //     .show(context);
                          } else {
                            register(context);
                          }
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
                                maxWidth: 400.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Register",
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
            )));
  }

  Future<void> register(context) async {
    String uri = Config.server;
    String path = '/campconnectadminapi/studentRegistrationApi.php';
    Map<String, String> headers = {"Access-Control-Allow-Origin": "*"};

    // Map<String, String> body = {
    //   'EmailId': 'hello20@jklu.edu.in',
    //   'Passwords': '123456',
    //   'Name': 'Hunter P',
    //   'RollNumber': '2021BTechCSE066',
    //   'RoomNumber': '4001',
    //   'PersonalContactNumber': '9907261014',
    //   'ParentsContactNumber': '9685795856',
    //   'MentorName': 'S Taruna'
    // };

    Map<String, String> body = {
      'EmailId': signup_emailController.text,
      'Passwords': signup_passController.text,
      'Name': signup_nameController.text,
      'RollNumber': signup_rollController.text,
      'RoomNumber': signup_roomController.text,
      'PersonalContactNumber': signup_personalContactController.text,
      'ParentsContactNumber': signup_parentsContactController.text,
      'MentorName': signup_mentorController.text
    };

    try {
      final response =
          await http.post(Uri.http(uri, path), headers: headers, body: body);
      print(response.statusCode);
      final String str = jsonEncode(await response.body.toString());
      final decodedjson = jsonDecode(str);
      Map<String, dynamic> map = jsonDecode(decodedjson);
      if (map['error'] == 200) {
        // List list = map as List;
        // print(map['user']['EmailId']);
        print(map['user']);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) {
            return Login();
          },
        ));
      } else {
        MotionToast.error(
                title: Text("Error"), description: Text(map['message']))
            .show(context);
      }

      print(response.body.toString());
    } catch (err) {
      print(err.toString());
    }
  }
}
