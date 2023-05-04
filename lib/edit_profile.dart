

import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("Name : "),
            TextField(

              decoration: InputDecoration(
                hintText: "Nafim Ahmed"
              ),

            ),

            Text("Email : "),
            TextField(

              decoration: InputDecoration(
                  hintText: "example@gmail.com"
              ),

            ),


            Text("Personal Phone No. : "),
            TextField(

              decoration: InputDecoration(
                  hintText: "+8801XXXXXXXXXXXX"
              ),

            ),

            Text("Recidence Phone No. : "),
            TextField(

              decoration: InputDecoration(
                  hintText: "+8801XXXXXXX"
              ),

            ),


          ],
        ),
      ),
    );
  }

}