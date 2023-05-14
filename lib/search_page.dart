


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_nagair/ticket_list.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

enum SingingCharacter { oneWay, roundTrip }
// class SearchPage extends StatefulWidget{
//
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {












  String ticketday="0";
  String ticketmonth="0";
  String ticketyear="0";

  String ticketdayr="0";
  String ticketmonthr="0";
  String ticketyearr="0";

  bool _Return=false;






  List<String> listDeparature = <String>['Deparature', 'Dhaka','Syllet','Barishal','Thakurgaon', 'Rajshahi', 'Jassor'];

   List<String> listArrival = <String>['Arrival', 'Dhaka','Syllet','Barishal','Thakurgaon','Rajshahi', 'Jassor'];

   RxString dropdownValueDeparature = 'Deparature'.obs;

   RxString dropdownValueArrival = 'Arrival'.obs;

   RxString newDate="Select journey date".obs;

   RxString newDateReturn="Select return date".obs;

   DateTime date=DateTime(2023,01,1);
   SingingCharacter? _character = SingingCharacter.oneWay;
   bool Visible=false;





   // List<dynamic>? listDomestic,listInternational,listall;
   // List<String>?listName;
   //
   // Future getUserDataLocation() async
   // {
   //   var responseDomestic=await http.get(
   //       Uri.parse('https://nag-air-server.vercel.app/api/show-domestic-flight')
   //   );
   //
   //   var responseInternational=await http.get(
   //       Uri.parse('https://nag-air-server.vercel.app/api/show-international-flight')
   //   );
   //
   //  // setState((){
   //     listDomestic = jsonDecode(responseDomestic.body);
   //     listInternational=jsonDecode(responseInternational.body);
   //
   //     listall=listDomestic!+listInternational!;
   //
   //     for(int i=0;i<listall!.length;i++){
   //       listName?.add("${listall![i]["flightLocationName"]}");
   //     }
   //
   //     setState(() {
   //
   //       listArrival=listArrival+listName!;
   //       listDeparature=listDeparature+listName!;
   //
   //
   //     });
   //
   //
   //
   //
   //
   //  // });
   //
   //   //print(list?.length);
   //
   // }













   @override
  Widget build(BuildContext context) {


    String TrvType="oneWay";



    //getUserDataLocation();



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



              ///////////////////////////////////////////////////////

              Container(
                decoration: BoxDecoration(

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Travel type : "),
                    Row(
                      children: <Widget>[
                        Row(
                          children: [
                            Radio<SingingCharacter>(
                              value: SingingCharacter.oneWay,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                  Visible=false;
                                  _Return=false;
                                  TrvType="oneWay";
                                });
                              },
                            ),
                            const Text('One Way'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<SingingCharacter>(
                              value: SingingCharacter.roundTrip,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                  Visible=true;
                                  _Return=true;

                                  TrvType="roundTrip";

                                });
                              },
                            ),
                            const Text('Round trip'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),









              ////////////////////////////////////









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

                    ticketday= "${newtm.day}";
                    ticketmonth= "${newtm.month}";
                    ticketyear="${newtm.year}";
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

              ////////////////////////////////////////////////////////////

              Visibility(
                child: InkWell(
                  onTap: ()async{

                    DateTime? newtmr=await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    if(newtmr==null){
                      return;
                    }
                    else{

                      ticketdayr= "${newtmr.day}";
                      ticketmonthr= "${newtmr.month}";
                      ticketyearr="${newtmr.year}";
                      newDateReturn.value="   ${newtmr.day} / ${newtmr.month} / ${newtmr.year}";
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




                        Text("${newDateReturn.value}",

                          style:GoogleFonts.openSans(color: Colors.black,
                              fontSize: 15

                          ),

                        )



                        ///////////////////////////////////////////////////////

                      ],
                    ),
                  ),
                ),
                visible: Visible,
              ),


              ///////////////////////////////////////


              SizedBox(height: 20,),



              ElevatedButton(
                onPressed: () {

                  String RDate;

                  if(_Return){
                    RDate="${ticketyearr}-${ticketmonthr}-${ticketdayr}";
                  }else{
                    RDate="flightReturningDate";
                  }

                  // Navigator.pop(context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TicketList(

                            Travel_type: "$TrvType",
                            deperature: "${dropdownValueDeparature.value.toLowerCase()}",
                            arrival: "${dropdownValueArrival.value.toLowerCase()}",
                            journey_date: "${ticketyear}-${ticketmonth}-${ticketday}",
                            //journey_date: "${ticketyear}%2F${ticketmonth}%2F${ticketday}",
                            return_date: RDate//"flightReturningDate",

                          )
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


  @override
  void initState() {
    // TODO: implement initState
   // getUserDataLocation();
    super.initState();
  }


}