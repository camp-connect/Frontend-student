import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:student/Widgets/menu.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passController = TextEditingController();
  final _formKey_login = GlobalKey<FormState>();
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
          child: Column(
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
              Padding(
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
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black26, width: 2),
                    ),
                    labelText: 'Email',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 3),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  controller: passController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.password),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black26, width: 2),
                    ),
                    labelText: 'Password',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12),
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot your password?"),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 12),
                child: TextButton(
                  onPressed: () {},
                  child: Text("Use a password manager?"),
                ),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                      login(context);
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
                        constraints:
                            BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
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
        ),
      ),
    );
  }

  // Function for calling login post api
  // Future<void> login(context) async {
  //   if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
  //     var response = await http.post(
  //         Uri.parse("https://camp-connect-backend.herokuapp.com/api/login"),
  //         body: ({
  //           "email": emailController.text,
  //           "password": passController.text
  //         }));
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => Menu(name: "Aditya Shukla"),
  //           ));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text("Invalid Creditials"),
  //         ),
  //       );
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("Blank Field Not Allowed"),
  //       ),
  //     );
  //   }
  // }
  // Future<void> login(context) async {
  //   var headers = {'Content-Type': 'application/json'};
  //   var request = http.Request(
  //       'POST',
  //       Uri.parse(
  //           'https://camp-connect-backend.herokuapp.com/api/login/student'));
  //   request.body = json.encode({
  //     "userEmail": emailController.text,
  //     "userPassword": passController.text
  //   });
  //   print("requesting");
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     // print(await response.stream.bytesToString());

  //     final String str = jsonEncode(await response.stream.bytesToString());
  //     final decodedJson = jsonDecode(str);

  //     Map<String, dynamic> map = jsonDecode(decodedJson);
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Menu(name: map['name'], map: map),
  //         ));
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("Blank Field Not Allowed"),
  //       ),
  //     );
  //   }
  // }
  Future<void> login(context) async {
    String uri = "192.168.198.71:80";
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
    if (response.statusCode == 200) {
      final String str = jsonEncode(await response.body.toString());
      final decodedjson = jsonDecode(str);
      Map<String, dynamic> map = jsonDecode(decodedjson);
      if (map['user']['name'] == Null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid Credentials or User not approved"),
          ),
        );
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Menu(name: map['user']['Name'], map: map),
          ));
      }

      //   }
      // List list = map as List;
      print(map['user']);
      print(map['message']);
    }

    // print(response.body.toString());
    // } catch (err) {
    //   print(err.toString());
    // }
  }
}
