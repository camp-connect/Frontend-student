import 'package:flutter/material.dart';
import 'package:student/Widgets/thankyou.dart';
import 'package:http/http.dart' as http;
import './config.dart';
import 'dart:convert';

class ApproveStatusByStudent extends StatefulWidget {
  Map<String, dynamic> map;
  ApproveStatusByStudent({Key? key, required this.map}) : super(key: key);

  @override
  State<ApproveStatusByStudent> createState() =>
      _ApproveStatusByStudentState(status_map: map);
}

class _ApproveStatusByStudentState extends State<ApproveStatusByStudent> {
  Map<String, dynamic> status_map;
  _ApproveStatusByStudentState({Key? key, required this.status_map});

  static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
    fontFamily: 'openSans-medium',
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Container(
            margin: EdgeInsets.only(left: 80),
            child: Text(
              "Out State",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1566041510394-cf7c8fe21800?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                  fit: BoxFit.fill),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey.shade200,
                      radius: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-vector/boy-with-dental-braces-dental-care-little-boy-portrait-circular-frame_254685-951.jpg?w=740'),
                        radius: 100,
                        backgroundColor: Colors.white54,
                      ), //CircleAvatar
                    ), //CircleAvatar
                    SizedBox(
                      height: 25,
                    ), //SizedBox
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Student Name : ${widget.map['Name']}',
                        style: optionStyle,
                        softWrap: true,
                        maxLines: 10,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email Id : ${status_map['EmailId']}',
                        style: optionStyle,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Date : ${status_map['OutDate']}',
                        style: optionStyle,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Out Time : ${status_map['OutTime']}',
                        style: optionStyle,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'In Time : ${status_map['InTime']}',
                        style: optionStyle,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Purpose : ${status_map['Purpose']}',
                        style: optionStyle,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Parents Agreed : ${status_map['ParentsPermission']}',
                        style: optionStyle,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Outpass_in(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("You are inside the university"),
                                ),
                              );
                            },
                            child: Text('In')),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Outpass_out(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("You are outside the university"),
                                ),
                              );
                            },
                            child: Text('Out')),
                      ],
                    )
                  ],
                ),
              ),
            ) //Column
            ), //Center
      ),
    );
  }

  Future<void> Outpass_out(context) async {
    String uri = Config.server;
    String path = '/campconnectadminapi/outStatus.php';
    Map<String, String> headers = {"Access-Control-Allow-Origin": "*"};
    Map<String, String> body = {
      'EmailId': status_map['EmailId'],
      'OutStatus': 't',
      'OutDate': status_map['OutDate']
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

  Future<void> Outpass_in(context) async {
    String uri = Config.server;
    String path = '/campconnectadminapi/outStatus.php';
    Map<String, String> headers = {"Access-Control-Allow-Origin": "*"};
    Map<String, String> body = {
      'EmailId': status_map['EmailId'],
      'OutStatus': 'f',
      'OutDate': status_map['OutDate']
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
