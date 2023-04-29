

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'bottom_nav_page.dart';

class HomePage extends StatelessWidget{








  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          SizedBox(height: 50.sp,),


          Row(
            children: [
              Column(
                children: [
                  Text("Good Morning"),
                  Text("Book Ticket")
                ],
              )
            ],
          ),



          ElevatedButton(onPressed:() {
            // Navigator.pop(context);

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BottomBar(
                          initindx: 1,
                        )));

          }, child: Text("Book")),






          Container(
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            height: 20.h,
            width: 100.h,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: Center(child: Text('Dummy Card Text')

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }

}