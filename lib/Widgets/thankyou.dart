import 'package:flutter/material.dart';
import 'package:student/Widgets/menu.dart';

class ThanksPage extends StatefulWidget {
  ThanksPage({Key? key, required this.map}) : super(key: key);
  Map<String, dynamic> map;
  @override
  State<ThanksPage> createState() => _ThanksPageState(thankyou_map: map);
}

class _ThanksPageState extends State<ThanksPage> {
  _ThanksPageState({Key? key, required this.thankyou_map});
  Map<String, dynamic> thankyou_map;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          // onPressed: () {
          //   Navigator.of(context).push(MaterialPageRoute(
          //     builder: (_) {
          //       return Menu(name: "Aditya Shukla",);
          //     },
          //   ));
          // },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Response Registered",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 300,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.pink,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  title: Text(
                    'Thanks For Your Response',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Soon Your Query Will \n be processed",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return Menu(
                            name: thankyou_map['user']['Name'],
                            map: thankyou_map);
                      }));
                    },
                    child: Text(
                      "Back to DashBoard",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
