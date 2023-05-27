


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'seat_selection_page.dart';
import 'thick_container.dart';

class TicketList extends StatefulWidget
{

  final String Travel_type;
  final String deperature;
  final String arrival;
  final String journey_date;
  final String return_date;

  const TicketList({super.key, required this.Travel_type, required this.deperature, required this.arrival, required this.journey_date, required this.return_date});



  @override
  State<TicketList> createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {

  int _stackIndex = 0;

  String _singleValue = "Text alignment right";
  String _verticalGroupValue = "Pending";

  final _status = ["First", "Released", "Blocked"];


  List<dynamic>? listTicket;

  Future getUserDataTicket() async
  {
    var responseTicket=await http.get(
       // Uri.parse('https://nag-air-server.vercel.app/api/show-search-flight-result?flightReturningDate=${widget.return_date}&travelType=${widget.Travel_type}&flightFromCurrentLocation=${widget.deperature}&flightToDestinationLocation=${widget.arrival}&flightDepartingDate=${widget.journey_date}')
      Uri.parse("http://nag-air-server.vercel.app/api/show-search-flight-result?flightReturningDate=flightReturningDate&travelType=oneWay&flightFromCurrentLocation=dhaka&flightToDestinationLocation=jessore&flightDepartingDate=05-18-2023")
    );

    // var responseInternational=await http.get(
    //     Uri.parse('https://nag-air-server.vercel.app/api/show-international-flight')
    // );

    setState((){
      listTicket = jsonDecode(responseTicket.body);
      //listInternational=jsonDecode(responseInternational.body);

    });

    //print(list?.length);

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    getUserDataTicket();

    return listTicket!=null?Scaffold(
      body: ListView.builder(

        itemCount: listTicket?.length,

          itemBuilder: (context,int index){

            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${listTicket![index]["flightFromCurrentLocation"]}",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text("${listTicket![index]["flightDepartingTime"]}",

                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),

                        )
                      ],
                    ),

                    ///////////////////////////////////////////////



                    Container(
                      width: 30.w,
                      child: Expanded(
                          child: Stack(
                            children:[


                              SizedBox(
                                  height: 24.sp,
                                  child: LayoutBuilder(
                                    builder: (BuildContext context, BoxConstraints constrains){

                                      return Flex(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        direction: Axis.horizontal,
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate((constrains.constrainWidth()/6).floor(), (index) => SizedBox(
                                          width: 4,
                                          height: 2,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                            ),
                                          ),
                                        )
                                          /*Text("-",
                                    style: GoogleFonts.openSans(
                                      color: Colors.white,
                                    ),
                                  )*/

                                        ),

                                      );
                                    },


                                  )
                              ),



                              Container(
                                margin: EdgeInsets.only(top: 3.5),
                                child: Center(child: Transform.rotate(
                                  angle: 1.5,
                                  child : Icon(Icons.local_airport_rounded,color: Colors.black,),) ,),
                              )

                            ],


                          )
                      ),
                    ),


                    /////////////////////////////////////////////////

                    // Text("To",
                    //
                    //   style: TextStyle(
                    //       fontSize: 25,
                    //       fontWeight: FontWeight.bold
                    //   ),
                    //
                    // ),

                    Column(
                      children: [
                        Text("${listTicket![index]["flightToDestinationLocation"]}",

                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text("1:30 pm",

                          style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),

                        )
                      ],
                    ),
                  ],
                ),

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text("Air craft model : ${listTicket![index]["planeNumber"]}",

                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600
                      ),

                    ),
                    //Text("Flight No. : "),




                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                      height: 20.h,
                      width: 100.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listTicket?[index]["packageList"].length,
                              itemBuilder: (BuildContext context,int indx) => Card(
                                  child: InkWell(
                                          onTap: (){


                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>SeatSelectionPage()
                                                       ));

                                          },
                                          child: Container(

                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.pink.shade100,

                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.green
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("${listTicket?[index]["packageList"][indx]["packageName"]}",

                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold
                                                  ),

                                                ),

                                                Text("Price : ${listTicket?[index]["packageList"][indx]["packagesPrice"]}",

                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600
                                                  ),

                                                ),

                                                SizedBox(height: 15,),

                                                Text("20 Seats\nremaining",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      //fontWeight: FontWeight.bold
                                                  ),

                                                )

                                              ],
                                            ),
                                          ),
                                        ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),



                  ],
                ),
              ),
            );

      }
      ),
    ):Scaffold(
        body: Center(
          child: Text("Searching flight____",
            style: GoogleFonts.raleway(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),


          ),
        )
    );
  }
}