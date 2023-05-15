



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightHistory extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: [

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
    );
  }
  
}