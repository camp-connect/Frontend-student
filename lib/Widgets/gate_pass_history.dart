import 'dart:convert';
import 'package:student/Widgets/ApproveStatusByStudent.dart';
import './config.dart';
import '../Model/ListOfApprovedOutpass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GatePassHistory extends StatefulWidget {
  Map<String, dynamic> map;
  GatePassHistory({Key? key, required this.map}) : super(key: key);

  @override
  State<GatePassHistory> createState() =>
      _GatePassHistoryState(history_map: map);
}

class _GatePassHistoryState extends State<GatePassHistory> {
  Map<String, dynamic> history_map;
  _GatePassHistoryState({Key? key, required this.history_map});

  bool loading = false;
  Future<List<dynamic>> getRequest() async {
    List<Map<String, dynamic>> list = [];
    List<ApprovedOutpassDetail> list1 = [];

    String uri = Config.server;
    String path = '/campconnectadminapi/listOfApprovedOutpassForStudent.php';
    Map<String, String> headers = {"Access-Control-Allow-Origin": "*"};
    Map<String, String> body = {
      'EmailId': history_map['user']['EmailId'],
    };

    final response =
        await http.post(Uri.http(uri, path), headers: headers, body: body);

    print(history_map['user']['EmailId']);
    print(response.statusCode);
    print(response.body);
    loading = true;

    if (response.statusCode == 200) {
      var temp = listofApprovedOutpass(response.body);
      print(temp);
      for (var i in temp.approvedOutpassDetails) {
        print(i);
        list.add(i.toJson());
        list1.add(ApprovedOutpassDetail.fromJson(i.toJson()));
      }

      print(list[0]["Name"]);
      print(list1[0].name);
    }
    print(list);
    loading = false;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Approved Outpass"),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (loading) {
                return Container(
                  child: Center(
                    child: Row(
                      children: [
                        // SizedBox(
                        //   width: 40,
                        // ),
                        // Text(
                        //   "Loading....",
                        //   style: TextStyle(
                        //       fontSize: 25, fontWeight: FontWeight.bold),
                        // ),
                        // SizedBox(
                        //   width: 30,
                        // ),
                        // const CircularProgressIndicator(
                        //   backgroundColor: Colors.grey,
                        //   color: Colors.purple,
                        //   strokeWidth: 10,
                        // )

                        SizedBox(width: 140),
                        Center(
                          child: SpinKitWave(
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color:
                                      index.isEven ? Colors.blue : Colors.pink,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) => Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                      contentPadding: EdgeInsets.all(10.0),
                      trailing: Icon(Icons.arrow_forward),
                      title: Text(snapshot.data[index]['Name']),
                      subtitle: Text(snapshot.data[index]['OutDate']),
                      onTap: () {
                        DateTime now = new DateTime.now();
                        DateTime date =
                            new DateTime(now.year, now.month, now.day);

                        if (date.toString().split(" ")[0] ==
                            snapshot.data[index]['OutDate']) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ApproveStatusByStudent(
                                    map: snapshot.data[index]);
                              },
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Only Today's Date Request can be processed"),
                            ),
                          );
                        }
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return StudentsDetailsForOutPass(
                        //           snapshot.data[index]);
                        //     },
                        //   ),
                        // );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
