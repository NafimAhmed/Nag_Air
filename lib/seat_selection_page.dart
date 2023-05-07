


import 'dart:convert';
import 'dart:math';

import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:new_nagair/confirm_booking_page.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class SeatSelectionPage extends StatefulWidget
{

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {


  Map <String, dynamic>? apiMap;


  Future getUserData() async
  {
    var response=await http.get(
        Uri.parse('https://nag-air-server.vercel.app/api/show-single-flight-information?id=644e2230add4679f71549c5a')
    );


    setState((){
      apiMap = jsonDecode(response.body);
    });
    //print(list?.length);
  }









   List<String> items=[];

  var _chairStatus = [
    [1, 1, 1, 1, 1, 1, 1],
    [3, 3, 1, 1, 3, 3, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
  ];

  @override
  Widget build(BuildContext context) {

    getUserData();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Seat"),
      ),
      body: Column(
        children: [
          Text("Flight from : ${apiMap?["flightFromCurrentLocation"]} To ${apiMap?["flightToDestinationLocation"]}"),
          Text("Journey Date : ${apiMap?["flightDepartingDate"]} "),
          Text("Departing Time : ${apiMap?["flightDepartingTime"]} "),

          Text("Air craft Model : ${apiMap?["planeNumber"]}"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: <Widget>[
                      for (int i = 0; i < 9; i++)
                        Container(
                          margin: EdgeInsets.only(top: i == 0 ? 50 : 0),
                          child: Row(
                            children: <Widget>[
                              for (int x = 1; x < 7; x++)
                                Expanded(
                                  child: (x == 3) || (x == 4)
                                      ? Container()
                                      : Container(
                                    margin: EdgeInsets.all(5),
                                    child: _chairStatus[i][x - 1] == 1
                                        ? availableChair(i, x - 1)
                                        : _chairStatus[i][x - 1] == 2
                                        ? selectedChair(i, x - 1)
                                        : reservedChair(),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),

                ElevatedButton(
                  onPressed: () {

                    // Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                               ConfirmBookingPage()
                        )
                    );

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
                    "Confirm booking",
                    style: TextStyle(color: Colors.white, fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),









              ],
            ),
          ),
        ],
      )
    );
  }

  Widget selectedChair(int a, int b) {
    return InkWell(
      onTap: () {
        _chairStatus[a][b] = 1;
        setState(() {

        });
      },
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(3.0)),
      ),
    );
  }

  Widget availableChair(int a, int b) {
    return InkWell(
      onTap: () {
        _chairStatus[a][b] = 2;
        setState(() {
          items.add("$a/$b");



        });







      },
      child: Container(
        height: 40.0,
        width: 10.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          border: Border.all(
            color: Color.fromRGBO(0, 0, 0, 1),
            width: 1,
          ),
        ),
      ),
    );
  }

  Widget reservedChair() {
    return Container(
      height: 40.0,
      width: 10.0,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(3.0)),
    );
  }






}





