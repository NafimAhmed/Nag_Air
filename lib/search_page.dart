


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class SearchPage extends StatefulWidget{
//
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

class SearchPage extends StatelessWidget {
   List<String> listDeparature = <String>['Deparature', 'Dhaka', 'Rajshahi', 'Jassor'];

   List<String> listArrival = <String>['Arrival', 'Dhaka', 'Rajshahi', 'Jassor'];

   RxString dropdownValueDeparature = 'Deparature'.obs;
   RxString dropdownValueArrival = 'Arrival'.obs;



  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      body: Obx(()=>Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [

            SizedBox(height: 40,),
            // Gap(AppLayout.getHeight(40)),
            Text("What are \nYou Looking for ?",
              style: TextStyle(fontSize: 30.sp,color: Colors.black,fontWeight: FontWeight.bold),
            ),
            //Gap(AppLayout.getHeight(20)),

            SizedBox(height: 20,),



            Container(
              padding: EdgeInsets.symmetric(vertical: 12.sp,horizontal: 12.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.flight_takeoff_rounded,
                    //Icons.flight_takeoff_rounded,
                    color: Colors.pink,
                  ),
                  // Gap(AppLayout.getWidth(10)),

                  //Text(text,style: Styles.textStyle,)

                  SizedBox(width: 10,),

                  //////////////////////////////////////////////////////////////////////////////
                  DropdownButton<String>(
                    value: dropdownValueDeparature.value,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    style:  GoogleFonts.openSans(color: Colors.black,
                        fontSize: 18

                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      //setState(() {
                        dropdownValueDeparature.value = value!;
                      //});
                    },
                    items: listDeparature.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  ///////////////////////////////////////////////////////

                ],
              ),
            ),
            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.symmetric(vertical: 12.sp,horizontal: 12.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.flight_land_rounded,
                    //Icons.flight_takeoff_rounded,
                    color: Colors.pink,
                  ),
                  // Gap(AppLayout.getWidth(10)),

                  //Text(text,style: Styles.textStyle,)

                  SizedBox(width: 10,),

                  //////////////////////////////////////////////////////////////////////////////




                  DropdownButton<String>(
                    value: dropdownValueArrival.value,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    style:GoogleFonts.openSans(color: Colors.black,
                        fontSize: 18

                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                     // setState(() {
                        dropdownValueArrival.value = value!;
                     // });
                    },
                    items: listArrival.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),


                  ///////////////////////////////////////////////////////

                ],
              ),
            ),


            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.symmetric(vertical: 12.sp,horizontal: 12.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    //Icons.flight_takeoff_rounded,
                    color: Colors.pink,
                  ),
                  // Gap(AppLayout.getWidth(10)),

                  //Text(text,style: Styles.textStyle,)

                  SizedBox(width: 10,),

                  //////////////////////////////////////////////////////////////////////////////




                  InkWell(
                    onTap: (){
                      // SfDateRangePicker(
                      //   onSelectionChanged: (arg){
                      //
                      //   },
                      //   selectionMode: DateRangePickerSelectionMode.single,
                      //   initialSelectedRange: PickerDateRange(
                      //       DateTime.now().subtract(const Duration(days: 4)),
                      //       DateTime.now().add(const Duration(days: 3))),
                      // );
                    },
                    child: Text("Select journey date",

                      style:GoogleFonts.openSans(color: Colors.black,
                          fontSize: 15

                      ),

                    ),
                  )



                  ///////////////////////////////////////////////////////

                ],
              ),
            ),








          ],
        ),
      ),
      )

    );
  }
}