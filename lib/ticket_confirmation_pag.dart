

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TicketConfirmationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Confirm Booking"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text("Flight No.",
            style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text("Aircraft : ",
            style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text("Deparature :",
            style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text("Arrival : ",
            style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),),


          SizedBox(height: 20,),

          Text("passenger(s) : ", style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),),

          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context,index){
              return Container(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.person),
                        Text(" Nafim Ahmed",
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Icon(Icons.event_seat),
                        Text("2/B")
                      ],
                    )
                  ],
                ),
              );
            }
            ),
          ),

          SizedBox(height: 30,),

          Text("Total Amount : ",style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),),


          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {

                  // Navigator.pop(context);

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
                      horizontal: 20.w, vertical: 2.h),
                  backgroundColor: Colors.pink,
                  shape: StadiumBorder(),
                ),
                child: Text(
                  "Proceed to Pay",
                  style: TextStyle(color: Colors.white, fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),

        ],
      ),
    );
  }

}