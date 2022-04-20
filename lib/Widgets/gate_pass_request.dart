import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:student/Widgets/thankyou.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  DateTime out_date = DateTime(2022, 01, 12);
  TimeOfDay? in_time = const TimeOfDay(hour: 12, minute: 12);
  DateTime in_date = DateTime(2022, 01, 12);

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
          "Request For Gate Pass",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Purpose",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
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
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                Text(
                  'Out Time:- ${out_time!.hour.toString()}:${out_time!.minute.toString()}',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
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
                Text(
                  "Out Date:- ${out_date!.day}/${out_date!.month}/${out_date!.year}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
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
                Text(
                  'In Time:- ${in_time!.hour.toString()}:${in_time!.minute.toString()}',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
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
            ElevatedButton(
              onPressed: () {
                submit(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) {
                    return ThanksPage();
                  },
                ));
              },
              child: Text("Submit"),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(340, 50), primary: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submit(context) async {
    String uri = "192.168.198.71:80";
    String path = '/campconnectadminapi/outPassRequestByStudent.php';
    Map<String, String> headers = {"Access-Control-Allow-Origin": "*"};
    Map<String, String> body = {
      'Name': gate_map['user']['Name'],
      'EmailId': gate_map['user']['EmailId'],
      'Purpose': 'Work',
      'OutTime': '17:50:00',
      'InTime': '22:00:00',
      'OutDate': '2022:07:04',
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
