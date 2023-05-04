

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
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
                        Text("Passenger's Name",style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),),
                        Text("example@gmail.com",style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500
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
                    child : Text("Accumulated mile :",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),)),
              ],),

            Container(
              child: Column(
                children: [
                  Text("191283",style: TextStyle(
                      fontSize: 45,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),)
                ],
              ),
            ),







            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  //physics:  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  itemCount: 5,
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // AppColumnLayout(
                          //   firstText: "23042",
                          //   SecondText: "KM",
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text( "23042",
                                  style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  )
                              ),
                              Text("KM",style: GoogleFonts.openSans(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                              ),)
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text( "Cox's Bazar",
                                  style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  )
                              ),
                              Text("travel to",style: GoogleFonts.openSans(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                              ),)
                            ],
                          )



                          // AppColumnLayout(
                          //   firstText: "Cox's Bazar",
                          //   SecondText: "travel to",
                          // ),
                        ],

                      ),
                    );
                  }),
            ),




          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){

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