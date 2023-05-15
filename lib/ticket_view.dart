// import 'package:air_ticket_app/Utils/app_layout.dart';
// import 'package:air_ticket_app/Utils/app_style.dart';
// import 'package:air_ticket_app/widget/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'thick_container.dart';

class TicketView extends StatelessWidget {

  // final Map<String,dynamic> ticket;
   final bool? isColor;

  const TicketView({super.key, this.isColor});
   //const TicketView({Key? key, required this.isColor}) : super(key: key);



  @override
  Widget build(BuildContext context) {
   // final size=AppLayout.getSize(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(right: 10.sp),
          child: SizedBox(
        width: 85.w,
        //height: 28.h,//AppLayout.getHeight(175),
        child: Container(
          //margin: EdgeInsets.only(right: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isColor==true?Colors.blue.shade900:Colors.white,
                  borderRadius:  BorderRadius.only(topLeft: Radius.circular(21.sp),
                    topRight: Radius.circular(21.sp)
                  )
                ),

                padding: EdgeInsets.all(16.sp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("DAC", style: GoogleFonts.openSans(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                            color: Colors.white
                ),),
                        Expanded(child: Container()),
                        ThickContainer(color: isColor==true?Colors.white:Colors.blue),
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
                                                    color: Colors.white
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
                                      child : Icon(Icons.local_airport_rounded,color: Colors.white,),) ,),
                                  )

                                ],


                            )
                        ),





                        ThickContainer(color: isColor==true?Colors.white:Colors.blue,),
                        Expanded(child: Container()),
                        Text("LON", style: GoogleFonts.openSans(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          color: Colors.white
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
                                color: Colors.white
                          ),
                          ),
                        ),
                        Text("8H 30M",style: GoogleFonts.openSans(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                        SizedBox(
                          width: 70.sp,
                          child: Text(
                            "London",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.openSans(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // blue part of the ticket

              Container(
                color: isColor==true?Colors.red:Colors.white,

                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 2.5.h,
                      width: 10.sp,
                      child: DecoratedBox(

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(

                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),

                          )
                        ),

                      ),
                    ),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: LayoutBuilder(
                          builder: (BuildContext contect, BoxConstraints constrains){

                            return Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate((constrains.constrainWidth()/11).floor(), (index) => SizedBox(height: 1,width: 5,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.white
                                  ),
                                ),
                              )
                              ),
                            );

                          }

                      ),
                    )
                    ),
                    SizedBox(
                      height: 2.5.h,
                      width: 10.sp,
                      child: DecoratedBox(

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(

                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),

                            )
                        ),

                      ),
                    )
                  ],
                ),
              ),


              //orange part 1

              Container(

                decoration: BoxDecoration(
                    color: isColor==true?Colors.red:Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(isColor==true?21:0),
                        bottomRight: Radius.circular(isColor==true?21:0),//:Radius.circular(0),
                    )
                ),
                padding: const EdgeInsets.only(left:16,top: 10,right:16,bottom: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("May 1",style: GoogleFonts.openSans(
                              fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),),
                            SizedBox(height: 5.sp,),
                            Text("Date",style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),)
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("08:00 AM",style: GoogleFonts.openSans(
                            fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                        ),),
                            SizedBox(height: 10,),
                            Text("Deparaturetime",style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),)
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("23",style: GoogleFonts.openSans(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                              color: Colors.white
                        ),),
                            SizedBox(height: 5,),
                            Text("Flight No.",style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),)
                          ],
                        )


                      ],
                    )
                  ],
                ),


              )


            ],
          ),
        ),
      )),
    );
  }
}
