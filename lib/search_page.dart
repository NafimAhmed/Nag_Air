


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_nagair/ticket_list.dart';
import 'package:sizer/sizer.dart';


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
   RxString newDate="Select journey date".obs;

   DateTime date=DateTime(2023,01,1);



  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(()=>Container(
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

              InkWell(
                onTap: ()async{

                  DateTime? newtm=await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  if(newtm==null){
                    return;
                  }
                  else{
                    newDate.value="   ${newtm.day} / ${newtm.month} / ${newtm.year}";
                  }



                },
                child: Container(
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




                      Text("${newDate.value}",

                        style:GoogleFonts.openSans(color: Colors.black,
                            fontSize: 15

                        ),

                      )



                      ///////////////////////////////////////////////////////

                    ],
                  ),
                ),
              ),


              SizedBox(height: 20,),

              ElevatedButton(
                onPressed: () {

                  // Navigator.pop(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TicketList()
                              ));

                  // Get.to(BottomBar(),
                  //     duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                  //     transition: Transition.rightToLeft );




                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 32.w, vertical: 2.h),
                  backgroundColor: Colors.pink,
                  shape: StadiumBorder(),
                ),
                child: Text(
                  "Search For Flight",
                  style: TextStyle(color: Colors.white, fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),












            ],
          ),
        ),
        ),
      )

    );
  }
}