import 'package:flutter/material.dart';

import 'package:student/Widgets/ProfilePage.dart';
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
            Container(
              margin: EdgeInsets.fromLTRB(40, 100, 0, 0),
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
                  Container(
                    margin: EdgeInsets.only(left: 35),
                    child: Text(
                      "Welcome, ${this.new_name}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  ButtonTheme(
                    minWidth: 320,
                    height: 80,
                    child: RaisedButton(
                      color: Color(0xFF162A49),
                      child: Text(
                        'Request Gate Pass',
                        style: TextStyle(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) {
                            return GatePassRequest(
                              map: new_map,
                            );
                          },
                        ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                  ButtonTheme(
                    minWidth: 320,
                    height: 80,
                    child: RaisedButton(
                      color: Colors.pink,
                      child: Text(
                        'Register Complain',
                        style: TextStyle(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) {
                            return RegisterComplaint(
                              map: new_map,
                            );
                          },
                        ));
                      },
                    ),
                  ),
                  Container(
                    height: 300,
                    child: const Image(
                        image: AssetImage("assets/images/menu_background.png")),
                  ),
                ],
              ),
            ),
            ProfilePage(map: new_map),
          ],
        ),
      ),
    );
  }
}
