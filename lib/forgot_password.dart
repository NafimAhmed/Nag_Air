



//import 'dart:convert';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';


class ForgotPassword extends StatelessWidget
{

  TextEditingController emailController=TextEditingController();
  Map <String, dynamic>? apiMap;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("Password Reset"),
      ),

      body: Container(
        child: Column(
          children: [


            Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              child:TextField(
                maxLines: 1,
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Revovery Email",
                    labelStyle: GoogleFonts.raleway(

                    ),
                    floatingLabelStyle: GoogleFonts.raleway(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,

                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: "Enter eremail to send reset link",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.pink,
                            width: 1.0
                        )
                    )
                ),
              ),),




            ElevatedButton(
              onPressed: () async {

                // if(emailController.text.isEmpty)
                // {
                //
                //   Fluttertoast.showToast(
                //       msg: "Email is empty",
                //       toastLength: Toast.LENGTH_SHORT,
                //       gravity: ToastGravity.CENTER,
                //       timeInSecForIosWeb: 1,
                //       textColor: Colors.white,
                //       fontSize: 16.0
                //   );
                //
                //   return;
                // }

                // if(passwordController.text.isEmpty)
                // {
                //
                //   Fluttertoast.showToast(
                //       msg: "Password is empty",
                //       toastLength: Toast.LENGTH_SHORT,
                //       gravity: ToastGravity.CENTER,
                //       timeInSecForIosWeb: 1,
                //       textColor: Colors.white,
                //       fontSize: 16.0
                //   );
                //
                //   return;
                // }
                // Navigator.pop(context);

                //getUserData();

                Map<String, String> body = {
                  "email":"${emailController.text}"
                };

                var response=await http.put(
                    Uri.parse('https://nag-air-server.vercel.app/api/forgot-password-sys-to-sent-email'),
                    body: json.encode(body),
                    headers: {
                      'Content-Type': 'application/json',
                      'lang':'en'
                    }
                );

                print(response.body);
                print(response.statusCode);

                //apiMap = jsonDecode(response.body);

                if(response.statusCode==200){

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             BottomBar(
                  //               initindx: 0,
                  //               usersName: "${apiMap?["user"]["name"]}",
                  //               usersEmail: "${apiMap?["user"]["email"]}",
                  //               usersID: "${apiMap?["user"]["_id"]}",
                  //               usersToken: "${apiMap?["token"]}",
                  //             )
                  //     )
                  // );
                  //
                  // setNoteData("${apiMap?["token"]}");

                }
                else{

                  Fluttertoast.showToast(
                      msg: "${response.body}",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }


                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             BottomBar(
                //               initindx: 0,
                //             )));

                // Get.to(BottomBar(),
                //     duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                //     transition: Transition.rightToLeft );




              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w, vertical: 2.h),
                backgroundColor: Colors.pink,
                shape: StadiumBorder(),
              ),
              child: Text(
                "Send  recovery mail",
                style: TextStyle(color: Colors.white, fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }

}