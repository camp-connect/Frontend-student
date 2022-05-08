import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String email = "email";
  final String newUser = "newUser";
  final String profileData = "profileData";

//set data into shared preferences like this
  Future<void> loginSet(String email, bool newUser) async {
    final SharedPreferences loginSet = await SharedPreferences.getInstance();
    loginSet.setString(this.email, email);
    loginSet.setBool(this.newUser, newUser);
  }

//get value from shared preferences
  Future<bool?> loginGet() async {
    final SharedPreferences loginGet = await SharedPreferences.getInstance();
    bool? newUser;
    newUser = loginGet.getBool(this.newUser);
    return newUser;
  }

  //set data into shared preferences like this
  Future<void> profileDataSet(List<String> value) async {
    final SharedPreferences loginSet = await SharedPreferences.getInstance();
    loginSet.setStringList(this.profileData, value);
  }

//get value from shared preferences
  Future<List<String>?> profileDataGet() async {
    final SharedPreferences loginGet = await SharedPreferences.getInstance();
    List<String>? data;
    data = loginGet.getStringList(this.profileData);
    return data;
  }

  Future<void> eraseData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
