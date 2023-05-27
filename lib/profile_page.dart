

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_nagair/history_page.dart';
import 'package:new_nagair/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget
{

  final String usertoken;
  final String userId;

  const ProfilePage({super.key, required this.usertoken, required this.userId});


  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map <String, dynamic>? apiMap;

  Future getUserData() async
  {
    var response=await http.get(
        Uri.parse('https://nag-air-server.vercel.app/api/user-details?id=${widget.userId}'),

        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${widget.usertoken}',
        }


    );


    setState((){
      apiMap = jsonDecode(response.body);
    });
    //print(list?.length);
  }

  @override
  Widget build(BuildContext context) {

    getUserData();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Profile"),
            InkWell(
              onTap: ()async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("Token");

                Navigator.pop(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginPage()
                    )
                );


              },
                child: Icon(Icons.logout))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 30,),

            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 86,
                      width: 89,//AppLayout.getWidth(86),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/nag-air-logo.png")
                          )
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 55.w,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                              child: Text("${apiMap?["name"]}",
                                style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),)),
                        ),


                        Container(
                          width: 50.w,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text("${apiMap?["email"]}",style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade500
                            ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),


                        Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child: Icon(Icons.shield,
                                    size: 15,
                                  ),
                                  radius: 10,
                                  backgroundColor: Colors.pink,
                                ),
                                SizedBox(width: 5,),
                                Text("Premium Status",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    //Gap(20),

                    // FloatingActionButton.extended(
                    //   backgroundColor: Colors.green,
                    //   foregroundColor: Colors.black,
                    //   onPressed: () {
                    //     // Respond to button press
                    //   },
                    //   icon: Icon(Icons.edit),
                    //   label: Text('Edit'),
                    // )

                  ],
                )
            ),

            Divider(color: Colors.grey.shade500,),

            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Stack(

                children: [

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFF687daf),
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  Positioned(
                      right: -20,
                      top: -40,
                      child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(width: 18,color:  Colors.indigo)
                          //borderRadius: Border.all(width: 18)
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.lightbulb,
                              color: Colors.indigo,
                            ),
                            // radius: 25,
                            maxRadius: 25,
                            //minRadius: 25,
                            backgroundColor: Colors.white,
                          ),

                          //Gap(AppLayout.getWidth(12)),
                          SizedBox(width: 12,),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("You have earned reward",
                                style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                              Text("you have 10 flight in a year",
                                style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),)
                            ],
                          )


                        ],
                      )),


                ],
              ),
            ),




            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(30, 20, 10, 20),
                    child : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Accumulated mile :",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),


                      ],
                    )),
              ],),

            Container(
              child: Column(
                children: [
                  Text("191283",style: TextStyle(
                      fontSize: 45,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),),


                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(


                          child: Text(
                            "View History",
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,

                            ),

                          ),
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FlightHistory()
                                )
                            );
                          },
                        ),
                      ],
                    ),
                  )



                ],
              ),
            ),

            SizedBox(height: 20,),



            Container(
             // margin: EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 20, 10, 20),
                        child: Text("Customer ID :",

                          style: GoogleFonts.openSans(
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                          ),

                        ),
                      ),
                    ],
                  ),

                 // SizedBox(height: 5,),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${widget.userId}",

                        style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),

                      ),
                    ],
                  ),


                ],
              ),
            ),












          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FlightHistory()
                )
            );

          },
          label: Text("Edit"),
          hoverElevation: 100,
          icon: Icon(Icons.edit),
          splashColor: Colors.purple,

          backgroundColor: Colors.pink.shade500,
        ),
      ),


    );
  }
}