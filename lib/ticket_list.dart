


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'seat_selection_page.dart';

class TicketList extends StatefulWidget
{
  @override
  State<TicketList> createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {

  int _stackIndex = 0;

  String _singleValue = "Text alignment right";
  String _verticalGroupValue = "Pending";

  final _status = ["First", "Released", "Blocked"];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(

        itemCount: 5,

          itemBuilder: (context,int index){

            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Dhaka"),
                        Text("10:30 am")
                      ],
                    ),

                    Text("To"),

                    Column(
                      children: [
                        Text("Bankok"),
                        Text("1:30 pm")
                      ],
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Air craft model : "),
                    Text("Flight No. : "),




                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                      height: 15.h,
                      width: 100.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) => Card(
                                  child: InkWell(
                                          onTap: (){


                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>SeatSelectionPage()
                                                       ));

                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5),
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
                                                Text("Plutinum Class"),

                                                Text("Price : 56000"),

                                                Text("20 Seats\nremaining")

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

                      //  Row(
                      //   children: [
                      //
                      //
                      //
                      //
                      //     InkWell(
                      //       onTap: (){
                      //
                      //       },
                      //       child: Container(
                      //         padding: EdgeInsets.all(5),
                      //         decoration: BoxDecoration(
                      //           color: Colors.pink.shade100,
                      //
                      //           border: Border.all(
                      //             width: 2,
                      //             color: Colors.green
                      //           ),
                      //           borderRadius: BorderRadius.circular(12),
                      //         ),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text("Plutinum Class"),
                      //
                      //             Text("Price : 56000"),
                      //
                      //             Text("20 Seats\nremaining")
                      //
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     InkWell(
                      //       onTap: (){
                      //
                      //       },
                      //       child: Container(
                      //         padding: EdgeInsets.all(5),
                      //         decoration: BoxDecoration(
                      //           color: Colors.pink.shade100,
                      //
                      //           border: Border.all(
                      //               width: 2,
                      //               color: Colors.green
                      //           ),
                      //           borderRadius: BorderRadius.circular(12),
                      //         ),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text("Golden Class"),
                      //
                      //             Text("Price : 56000"),
                      //
                      //             Text("20 Seats\nremaining")
                      //
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     InkWell(
                      //       onTap: (){
                      //
                      //       },
                      //       child: Container(
                      //         padding: EdgeInsets.all(5),
                      //         decoration: BoxDecoration(
                      //           color: Colors.pink.shade100,
                      //
                      //           border: Border.all(
                      //               width: 2,
                      //               color: Colors.green
                      //           ),
                      //           borderRadius: BorderRadius.circular(12),
                      //         ),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text("Plutinum Class"),
                      //
                      //             Text("Price : 56000"),
                      //
                      //             Text("20 Seats\nremaining")
                      //
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //
                      //
                      //
                      //
                      //
                      //   ],
                      // ),


                    // SizedBox(
                    //   height: 50.0,
                    //   child: RadioGroup<String>.builder(
                    //     direction: Axis.horizontal,
                    //     groupValue: _verticalGroupValue,
                    //     horizontalAlignment: MainAxisAlignment.spaceAround,
                    //     onChanged: (value) => setState(() {
                    //       _verticalGroupValue = value ?? '';
                    //     }),
                    //     items: _status,
                    //     textStyle: const TextStyle(
                    //       fontSize: 15,
                    //       color: Colors.blue,
                    //     ),
                    //     itemBuilder: (item) => RadioButtonBuilder(
                    //       item,
                    //     ),
                    //   ),
                    // ),


                  ],
                ),
              ),
            );

      }
      ),
    );
  }
}