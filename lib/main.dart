import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_nagair/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'bottom_nav_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});





  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          // This is the theme of your application.
          //
          // Try running your application with "fl utter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.

          primarySwatch: Colors.pink,
        ),
        home:  LoginPage(),
      );
    });
  }



  Future<dynamic> check() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("Token")) {

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             BottomBar(
      //               initindx: 0,
      //               usersName: "${prefs.get("UserName")}",
      //               usersEmail: "${prefs.get("UserEmail")}",
      //               usersID: "${prefs.get("UserID")}",
      //               usersToken: "${prefs.get("Token")}",
      //             )
      //     )
      // );

      // return BottomBar(
      //   initindx: 0,
      //   usersName: "${prefs.get("UserName")}",
      //   usersEmail: "${prefs.get("UserEmail")}",
      //   usersID: "${prefs.get("UserID")}",
      //   usersToken: "${prefs.get("Token")}",
      // );

    }

  }



}

