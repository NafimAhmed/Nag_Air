



import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'confirm_passenger_data.dart';

class PassengerQuantity extends StatefulWidget{

  @override
  State<PassengerQuantity> createState() => _PassengerQuantityState();
}

class _PassengerQuantityState extends State<PassengerQuantity> {
  int _currentValueAdult = 0;
  int _currentValueChild = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text("Number of Adult Passenger : "),

            NumberPicker(
              value: _currentValueAdult,
              minValue: 0,
              maxValue: 100,
              axis: Axis.horizontal,
              onChanged: (value) => setState(() => _currentValueAdult = value),
            ),
            Text('Current value: $_currentValueAdult'),


            Text("Number of child Passenger : "),

            NumberPicker(
              value: _currentValueChild,
              minValue: 0,
              maxValue: 100,
              axis: Axis.horizontal,
              onChanged: (value) => setState(() => _currentValueChild = value),
            ),
            Text('Current value: $_currentValueChild'),



            ElevatedButton(onPressed: (){

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      ConfirmPassengerData()
                          //TicketConfirmationPage()
                  ));
            },
                child: Text("Next")
            ),

          ],
        ),
      ),
    );
  }
}