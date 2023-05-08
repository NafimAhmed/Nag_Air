


import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart';

import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:new_nagair/confirm_booking_page.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

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
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Flight from : ${apiMap?["flightFromCurrentLocation"]} To ${apiMap?["flightToDestinationLocation"]}",

                  style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),

                ),
                Text("Journey Date : ${dateFormate(apiMap?["flightDepartingDate"])} ",
                  style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),

                ),
                Text("Departing Time : ${apiMap?["flightDepartingTime"]} ",

                  style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),

                ),
                Text("Air craft Model : ${apiMap?["planeNumber"]}",

                  style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),

                ),

              ],
            ),
          ),




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


  String dateFormate(String data){


    DateTime dateTime = getFormattedDateFromFormattedString(
        value: data,
        currentFormat: "yyyy-MM-ddTHH:mm:ssZ",
        desiredFormat: "yyyy-MM-dd");


    String formattedDate = DateFormat.yMMMEd().format(dateTime);

    return formattedDate;//dateTime.toString();



  }


  getFormattedDateFromFormattedString(
      {required value,
        required String currentFormat,
        required String desiredFormat,
        isUtc = false}) {
    DateTime? dateTime = DateTime.now();
    if (value != null || value.isNotEmpty) {
      try {
        dateTime = DateFormat(currentFormat).parse(value, isUtc).toLocal();
      } catch (e) {
        print("$e");
      }
    }
    return dateTime;
  }





}





