import 'package:flutter/material.dart';

import 'package:student/Widgets/ProfilePage.dart';
import 'package:student/Widgets/gate_pass_history.dart';
import 'package:student/Widgets/gate_pass_request.dart';
import 'package:student/Widgets/register_complaint.dart';

class Menu extends StatefulWidget {
  Menu({Key? key, required this.name, required this.map}) : super(key: key);

  final String name;
  final Map<String, dynamic> map;
  @override
  State<Menu> createState() =>
      _MenuState(new_name: this.name, new_map: this.map);
}

class _MenuState extends State<Menu> {
  static const TextStyle optionStyle = TextStyle(
    fontSize: 25,
    color: Colors.brown,
    fontWeight: FontWeight.w500,
  );
  _MenuState({Key? key, required this.new_name, required this.new_map});
  final String new_name;
  final Map<String, dynamic> new_map;

  int _counter = 0;

  int _selected_Index = 0;
  PageController pageController = PageController();

  void ItemTapped(int index) {
    setState(() {
      _selected_Index = index;
    });
    pageController.jumpToPage(index);
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Color.fromRGBO(223, 230, 237, 1),
    minimumSize: Size(320, 60),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              title: Text("Profile")),
        ],
        currentIndex: _selected_Index,
        onTap: ItemTapped,
        fixedColor: Color.fromRGBO(101, 88, 245, 1),
      ),
      body: Container(
        child: PageView(
          controller: pageController,
          children: [
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 30, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (_) {
                      //         return GatePassRequest();
                      //       },
                      //     ));
                      //   },
                      //   style: raisedButtonStyle,
                      //   child: Text("Request Gate Pass"),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 35),
                      //   child: Text(
                      //     "Welcome, ${this.new_name}",
                      //     style: TextStyle(
                      //       fontSize: 22,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                          ),
                          color: Color(0xFF363F93),
                        ),
                        // child: Stack(
                        //   children: [
                        //     // Positioned(
                        //     //   top: 80,
                        //     //   left:0,
                        //     //   child: Container(
                        //     //     height: ,
                        //     //   ),
                        //     // ),
                        //   ],
                        // ),
                        child: Center(
                            child: Text(
                          "Welcome, ${this.new_name.split(' ')[0]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'sans-serif',
                            fontSize: 20,
                          ),
                        )),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (_) {
                              //     return OutPassRequests();
                              //   },
                              //   settings: RouteSettings(
                              //     name: 'OutPass',
                              //   ),
                              // ));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return GatePassRequest(
                                      map: new_map,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              height: 200,
                              // margin: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/outpass .jpg'),
                                    fit: BoxFit.fill),
                              ),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Out Pass',
                                    textAlign: TextAlign.left,
                                    style: optionStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (_) {
                              //     return OutPassRequests();
                              //   },
                              //   settings: RouteSettings(
                              //     name: 'OutPass',
                              //   ),
                              // ));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RegisterComplaint(
                                      map: new_map,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              height: 200,
                              // margin: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/complaint.jpg'),
                                    fit: BoxFit.fill),
                              ),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Register Complaint',
                                    textAlign: TextAlign.left,
                                    style: optionStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      //THIRD ONE

                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return GatePassHistory(
                                      map: new_map,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              height: 200,
                              // margin: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/history.jpg'),
                                    fit: BoxFit.fill),
                              ),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'OutPass History',
                                    textAlign: TextAlign.left,
                                    style: optionStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (_) {
                      //         return RegisterComplaint();
                      //       },
                      //     ));
                      //   },
                      //   style: raisedButtonStyle,
                      //   child: Text("Register Complain"),
                      // ),

                      // ButtonTheme(
                      //   minWidth: 320,
                      //   height: 80,
                      //   child: RaisedButton(
                      //     color: Colors.pink,
                      //     child: Text(
                      //       'Register Complain',
                      //       style: TextStyle(fontSize: 18),
                      //     ),
                      //     textColor: Colors.white,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(50),
                      //     ),
                      //     onPressed: () {
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (_) {
                      //           return RegisterComplaint(
                      //             map: new_map,
                      //           );
                      //         },
                      //       ));
                      //     },
                      //   ),
                      // ),
                      // Container(
                      //   height: 150,
                      //   child: const Image(
                      //       image: AssetImage("assets/images/menu_background.png")),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            ProfilePage(map: new_map),
          ],
        ),
      ),
    );
  }
}
