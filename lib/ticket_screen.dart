


import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_nagair/thick_container.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'ticket_view.dart';

class TicketScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Tickets"),),
      body: SingleChildScrollView(
        child: Container(
          child: Column(

            children: [

              SizedBox(height: 30,),



              Container(
                width: 80.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ToggleSwitch(
                    minWidth: 35.5.w,



                    initialLabelIndex: 0,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['Upcoming', 'Previous'],
                    icons: [Icons.airplane_ticket, Icons.confirmation_num],
                    activeBgColors: [[Colors.pink],[Colors.pink]],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ),
              ),






             ListView.builder(
               physics: ScrollPhysics(),
               shrinkWrap: true,
               itemCount: 2,
              itemBuilder: (context, index){

                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal:6.w,vertical: 2.h),
                      padding: EdgeInsets.symmetric(horizontal:3.w,vertical: 1.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all()
                      ),
                      child: Column(
                        children: [

                          Row(
                            children: [
                              Text("DAC", style: GoogleFonts.openSans(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),),
                              Expanded(child: Container()),
                              ThickContainer(color: Colors.black),
                              Expanded(
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





                              ThickContainer(color: Colors.black),
                              Expanded(child: Container()),
                              Text("LON", style: GoogleFonts.openSans(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),),
                            ],
                          ),
                          SizedBox(height: 3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 70.sp,
                                child: Text(/*"New-York "*/"Dhaka",
                                  style: GoogleFonts.openSans(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                              Text("8H 30M",style: GoogleFonts.openSans(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),),
                              SizedBox(
                                width: 70.sp,
                                child: Text(
                                  "London",
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.openSans(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ],
                          ),


                          SizedBox(height: 30,),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("May 1",style: GoogleFonts.openSans(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                  SizedBox(height: 5.sp,),
                                  Text("Date",style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),)
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("08:00 AM",style: GoogleFonts.openSans(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                  SizedBox(height: 10,),
                                  Text("Deparaturetime",style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),)
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("23",style: GoogleFonts.openSans(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                  SizedBox(height: 5,),
                                  Text("Flight No.",style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),)
                                ],
                              )


                            ],
                          ),

                          SizedBox(height: 30,),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Passenger Name",style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  )),
                                  Text("Passenger",style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  ),)
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text( "5221 365869",
                                      style: GoogleFonts.openSans(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              )
                                  ),
                                  Text("Passport/NID",style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  ),)
                                ],
                              )
                              // AppColumnLayout(
                              //   firstText: "Passenger Name",
                              //   SecondText: "Passenger",
                              // ),
                              // AppColumnLayout(
                              //   firstText: "5221 365869",
                              //   SecondText: "Passport/NID",
                              // )
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text("Passenger name", style: Styles.headlineStyle3.copyWith(color: Colors.black),),
                              //     Gap(5),
                              //     Text("Passenger", style: Styles.headlineStyle3.copyWith(color: Colors.grey.shade500),),
                              //   ],
                              // )
                            ],
                          ),


                          SizedBox(height: 30,),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ticket number",style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  )),
                                  Text("Ticket No.",style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  ),)
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text( "Booking Code",
                                      style: GoogleFonts.openSans(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      )
                                  ),
                                  Text("Booking Code",style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  ),)
                                ],
                              )
                              // AppColumnLayout(
                              //   firstText: "Passenger Name",
                              //   SecondText: "Passenger",
                              // ),
                              // AppColumnLayout(
                              //   firstText: "5221 365869",
                              //   SecondText: "Passport/NID",
                              // )
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text("Passenger name", style: Styles.headlineStyle3.copyWith(color: Colors.black),),
                              //     Gap(5),
                              //     Text("Passenger", style: Styles.headlineStyle3.copyWith(color: Colors.grey.shade500),),
                              //   ],
                              // )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ticket number",style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  )),
                                  Text("Ticket No.",style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  ),)
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text( "Booking Code",
                                      style: GoogleFonts.openSans(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      )
                                  ),
                                  Text("Booking Code",style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  ),)
                                ],
                              )
                              // AppColumnLayout(
                              //   firstText: "Passenger Name",
                              //   SecondText: "Passenger",
                              // ),
                              // AppColumnLayout(
                              //   firstText: "5221 365869",
                              //   SecondText: "Passport/NID",
                              // )
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text("Passenger name", style: Styles.headlineStyle3.copyWith(color: Colors.black),),
                              //     Gap(5),
                              //     Text("Passenger", style: Styles.headlineStyle3.copyWith(color: Colors.grey.shade500),),
                              //   ],
                              // )
                            ],
                          ),

                          SizedBox(height: 30,),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Visa****2426",style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  )),
                                  Text("Payment Method",style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  ),)
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text( "24 BDT.",
                                      style: GoogleFonts.openSans(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      )
                                  ),
                                  Text("Price",style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  ),)
                                ],
                              )
                              // AppColumnLayout(
                              //   firstText: "Passenger Name",
                              //   SecondText: "Passenger",
                              // ),
                              // AppColumnLayout(
                              //   firstText: "5221 365869",
                              //   SecondText: "Passport/NID",
                              // )
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text("Passenger name", style: Styles.headlineStyle3.copyWith(color: Colors.black),),
                              //     Gap(5),
                              //     Text("Passenger", style: Styles.headlineStyle3.copyWith(color: Colors.grey.shade500),),
                              //   ],
                              // )
                            ],
                          ),




                          Container(

                            margin: EdgeInsets.fromLTRB(0,20,00, 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Container(


                                    child:ClipRRect (
                                        borderRadius: BorderRadius.circular(15),
                                        child: BarcodeWidget(
                                          barcode: Barcode.code128(),
                                          data: "Passanger number: Passenger, flight no: flight no, Passport no: Passport",
                                          drawText: false,
                                          color: Colors.black,
                                          width: 65.w,
                                          height: 70,
                                        )
                                    )
                                )



                                // AppColumnLayout(
                                //   firstText: "Visa****2426",
                                //   SecondText: "Payment Method",
                                // ),
                                // AppColumnLayout(
                                //   firstText: "\$ 24.00",
                                //   SecondText: "Price",
                                // )
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Text("Passenger name", style: Styles.headlineStyle3.copyWith(color: Colors.black),),
                                //     Gap(5),
                                //     Text("Passenger", style: Styles.headlineStyle3.copyWith(color: Colors.grey.shade500),),
                                //   ],
                                // )
                              ],
                            ),),







                        ],
                      ),
                    ),



                    TicketView(
                      isColor: true,
                    )//Cent




                  ],
                );

             }
             ),

            ],
          ),
        ),
      ),
    );
  }

}