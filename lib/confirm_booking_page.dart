


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmBookingPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [


          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
              itemBuilder: (context,int index){
            return Column(
              children: [

                Text("Passenger ${index+1}")

              ],
            );
          }
          )

        ],
      ),
    );
  }

}