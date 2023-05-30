



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sizer/sizer.dart';

import 'confirm_passenger_data.dart';

class PassengerQuantity extends StatefulWidget{

  @override
  State<PassengerQuantity> createState() => _PassengerQuantityState();
}

class _PassengerQuantityState extends State<PassengerQuantity> {
  int _currentValueAdult = 1;
  int _currentValueChild = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Number of passengers"),
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical:10 ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.pink
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [

                    Text("Number of Adult Passenger : ",

                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),

                    ),

                    SizedBox(
                      height: 30,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(Icons.arrow_back_ios,
                          size: 30,

                        ),
                        SizedBox(
                          width:70.w,
                          child: NumberPicker(
                            value: _currentValueAdult,
                            minValue: 0,
                            maxValue: 40,
                            axis: Axis.horizontal,
                            onChanged: (value) => setState(() => _currentValueAdult = value),
                          ),
                        ),
                        
                        Icon(Icons.arrow_forward_ios,

                          size: 30,

                        )
                        
                      ],
                    ),
                    Text('Addult Passenger Number : $_currentValueAdult',

                      style: GoogleFonts.openSans(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),

                    ),



                  ],
                ),
              ),

              Container(



                margin: EdgeInsets.symmetric(horizontal: 10,vertical:10 ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.pink
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),


                child: Column(
                  children: [

                    Text("Number of child Passenger : ",

                      style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),

                    ),

                    SizedBox(height: 30,),

                    Row(
                      children: [

                        Icon(Icons.arrow_back_ios,
                          size: 30,

                        ),

                        SizedBox(
                          width:70.w,
                          child: NumberPicker(
                            value: _currentValueChild,
                            minValue: 0,
                            maxValue: 40,
                            axis: Axis.horizontal,
                            onChanged: (value) => setState(() => _currentValueChild = value),
                          ),
                        ),

                        Icon(Icons.arrow_forward_ios,

                          size: 30,

                        )
                      ],
                    ),
                    Text('Child Passenger Number: $_currentValueChild',

                      style: GoogleFonts.openSans(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),

                    ),





                  ],
                ),
              ),





              ElevatedButton(onPressed: (){

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        ConfirmPassengerData(
                          passenger_numb: _currentValueAdult+_currentValueChild,
                        )
                            //TicketConfirmationPage()
                    ));
              },
                  child: Text("Next")
              ),

            ],
          ),
        ),
      ),
    );
  }
}