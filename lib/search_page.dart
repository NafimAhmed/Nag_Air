


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

   int selectedIndex_depart=-1;
   int selectedIndex_arrrival=-1;

   //List<String>? listall;

  List<dynamic>? listDomestic,listInternational;

  Future getUserDataDomestic() async
  {
    var responseDomestic=await http.get(
        Uri.parse('https://nag-air-server.vercel.app/api/show-domestic-flight')
    );

    var responseInternational=await http.get(
        Uri.parse('https://nag-air-server.vercel.app/api/show-international-flight')
    );

    setState((){
      listDomestic = jsonDecode(responseDomestic.body);
      listInternational=jsonDecode(responseInternational.body);

      // for(int i=0;i<=listInternational!.length ;i++){
      //   listDomestic?.add(listInternational![i]);
      // }
    });

    for(int i=0;i<=listInternational!.length ;i++){
      listDomestic?.add(listInternational![i]);
    }


    // for(int i=0;i<=listDomestic!.length ;i++){
    //
    //   listall!.add(listDomestic![i]["flightLocationName"]);
    //
    // }
    // //print(list?.length);
  }













  String ticketday="0";
  String ticketmonth="0";
  String ticketyear="0";

  String ticketdayr="0";
  String ticketmonthr="0";
  String ticketyearr="0";

  bool _Return=false;






  List<String> listDeparature = <String>['Select Deparature Destination', 'Dhaka','Syllet','Barishal','Thakurgaon', 'Rajshahi', 'Jassor'];

   List<String> listArrival = <String>['Select Arrival Destination', 'Dhaka','Syllet','Barishal','Thakurgaon','Rajshahi', 'Jassor'];

   RxString dropdownValueDeparature = 'Select Deparature Destination'.obs;

   RxString dropdownValueArrival = 'Select Arrival Destination'.obs;

   RxString newDate="Select journey date".obs;

   RxString newDateReturn="Select return date".obs;

   DateTime date=DateTime.now();
   SingingCharacter? _character = SingingCharacter.oneWay;
   bool Visible=false;
















   @override
  Widget build(BuildContext context) {


    String TrvType="oneWay";



    getUserDataDomestic();




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




              Column(
                children: [
                  Row(
                    children: [

                      Icon(Icons.flight_takeoff),

                      Text(" Depart From : ",

                        style: GoogleFonts.openSans(
                          fontSize: 20
                        ),

                      ),
                    ],
                  ),



                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                    height: 60,
                    width: 100.w,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: listDomestic?.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Card(
                                child:
                                InkWell(
                                  onTap: (){
                                    setState(() {

                                      selectedIndex_depart=index;
                                    });

                                  },
                                  child: Container(
                                    height: 10,
                                    width: 40.w,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: selectedIndex_depart==index?Colors.pink: Colors.indigo,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Container(
                                        //   decoration: BoxDecoration(
                                        //       borderRadius: BorderRadius.circular(10)
                                        //   ),
                                        //   child: Image.network("${listDomestic![index]["locationImage"]}",
                                        //     height: 100,
                                        //
                                        //   ),
                                        // ),
                                        //SizedBox(height: 10,),
                                        Text("${listDomestic![index]["flightLocationName"]}",
                                          style: TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),
                                        ),

                                        // Text("${listDomestic![index]["tickitPrice"]}",
                                        //     style: TextStyle(fontSize: 17,color: Color(0xFFeeedf2)/*Colors.grey.shade500*/,fontWeight: FontWeight.bold)//TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),
                                        // ),

                                      //  SizedBox(height: 8,),


                                      ],
                                    ),
                                  ),
                                )//Center(child: Text('Dummy Card Text')),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),






              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 12.sp,horizontal: 12.sp),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12.sp),
              //       color: Colors.white
              //   ),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.flight_takeoff_rounded,
              //         //Icons.flight_takeoff_rounded,
              //         color: Colors.pink,
              //       ),
              //       // Gap(AppLayout.getWidth(10)),
              //
              //       //Text(text,style: Styles.textStyle,)
              //
              //       SizedBox(width: 10,),
              //
              //       //////////////////////////////////////////////////////////////////////////////
              //       DropdownButton<String>(
              //         value: dropdownValueDeparature.value,
              //         icon: const Icon(Icons.arrow_drop_down),
              //         elevation: 16,
              //         style:  GoogleFonts.openSans(color: Colors.black,
              //             fontSize: 18
              //
              //         ),
              //         underline: Container(
              //           height: 2,
              //           color: Colors.transparent,
              //         ),
              //         onChanged: (String? value) {
              //           // This is called when the user selects an item.
              //           //setState(() {
              //             dropdownValueDeparature.value = value!;
              //           //});
              //         },
              //         items: listDeparature.map<DropdownMenuItem<String>>((String value) {
              //           return DropdownMenuItem<String>(
              //             value: value,
              //             child: Text(value),
              //           );
              //         }).toList(),
              //       ),
              //       ///////////////////////////////////////////////////////
              //
              //     ],
              //   ),
              // ),



              SizedBox(height: 20,),

              Column(
                children: [
                  Row(
                    children: [

                      Icon(Icons.flight_land),

                      Text(" Arrive to : ",

                        style: GoogleFonts.openSans(
                            fontSize: 20
                        ),

                      ),
                    ],
                  ),



                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                    height: 60,
                    width: 100.w,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: listDomestic?.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Card(
                                    child:
                                    InkWell(
                                      onTap: (){
                                        setState(() {

                                          selectedIndex_arrrival=index;
                                        });

                                      },
                                      child: Container(
                                        height: 10,
                                        width: 40.w,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: selectedIndex_arrrival==index?Colors.pink: Colors.indigo,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // Container(
                                            //   decoration: BoxDecoration(
                                            //       borderRadius: BorderRadius.circular(10)
                                            //   ),
                                            //   child: Image.network("${listDomestic![index]["locationImage"]}",
                                            //     height: 100,
                                            //
                                            //   ),
                                            // ),
                                            //SizedBox(height: 10,),
                                            Text("${listDomestic![index]["flightLocationName"]}",
                                              style: TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),
                                            ),

                                            // Text("${listDomestic![index]["tickitPrice"]}",
                                            //     style: TextStyle(fontSize: 17,color: Color(0xFFeeedf2)/*Colors.grey.shade500*/,fontWeight: FontWeight.bold)//TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),
                                            // ),

                                            //  SizedBox(height: 8,),


                                          ],
                                        ),
                                      ),
                                    )//Center(child: Text('Dummy Card Text')),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 12.sp,horizontal: 12.sp),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12.sp),
              //       color: Colors.white
              //   ),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.flight_land_rounded,
              //         //Icons.flight_takeoff_rounded,
              //         color: Colors.pink,
              //       ),
              //       // Gap(AppLayout.getWidth(10)),
              //
              //       //Text(text,style: Styles.textStyle,)
              //
              //       SizedBox(width: 10,),
              //
              //       //////////////////////////////////////////////////////////////////////////////
              //
              //
              //
              //
              //       DropdownButton<String>(
              //         value: dropdownValueArrival.value,
              //         icon: const Icon(Icons.arrow_drop_down),
              //         elevation: 16,
              //         style:GoogleFonts.openSans(color: Colors.black,
              //             fontSize: 18
              //
              //         ),
              //         underline: Container(
              //           height: 2,
              //           color: Colors.transparent,
              //         ),
              //         onChanged: (String? value) {
              //           // This is called when the user selects an item.
              //          // setState(() {
              //             dropdownValueArrival.value = value!;
              //          // });
              //         },
              //         items: listArrival.map<DropdownMenuItem<String>>((String value) {
              //           return DropdownMenuItem<String>(
              //             value: value,
              //             child: Text(value),
              //           );
              //         }).toList(),
              //       ),
              //
              //
              //       ///////////////////////////////////////////////////////
              //
              //     ],
              //   ),
              // ),


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




                  if(selectedIndex_arrrival<0&&selectedIndex_depart<0){

                    Fluttertoast.showToast(
                        msg: "Select arrival and deparature Location",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.pink,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );

                    return;

                  }



                 else if(selectedIndex_depart<0){

                    Fluttertoast.showToast(
                        msg: "Select Departing location",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.pink,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    return;

                  }
                 else if(selectedIndex_arrrival<0){

                    Fluttertoast.showToast(
                        msg: "Select Destonation",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.pink,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    return;

                  }

                  else if(selectedIndex_depart==selectedIndex_arrrival){

                    Fluttertoast.showToast(
                        msg: "Destination and deparature can't be the same place. Select correct depart and destibnation Location",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.pink,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    return;

                  }


                  else if("${ticketday}"=="0"|| "${ticketmonth}" =="0"||"${ticketyear}"=="0"){

                    Fluttertoast.showToast(
                        msg: "Select Journey date",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.pink,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    return;

                  }

                  else{

                    String RDate;

                    if(_Return){
                      RDate="${ticketyearr}-${ticketmonthr}-${ticketdayr}";
                    }else{
                      RDate="flightReturningDate";
                    }

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
                                )
                    );

                    // Fluttertoast.showToast(
                    //     msg: "${listDomestic![selectedIndex_depart]["flightLocationName"]} to ${listDomestic![selectedIndex_arrrival]["flightLocationName"]} "
                    //         "in ${ticketday}/${ticketmonth}/${ticketyear}",
                    //     toastLength: Toast.LENGTH_SHORT,
                    //     gravity: ToastGravity.CENTER,
                    //     timeInSecForIosWeb: 1,
                    //     backgroundColor: Colors.pink,
                    //     textColor: Colors.white,
                    //     fontSize: 16.0
                    // );

                  }






                  // String RDate;
                  //
                  // if(_Return){
                  //   RDate="${ticketyearr}-${ticketmonthr}-${ticketdayr}";
                  // }else{
                  //   RDate="flightReturningDate";
                  // }
                  //
                  // // Navigator.pop(context);
                  //
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => TicketList(
                  //
                  //           Travel_type: "$TrvType",
                  //           deperature: "${dropdownValueDeparature.value.toLowerCase()}",
                  //           arrival: "${dropdownValueArrival.value.toLowerCase()}",
                  //           journey_date: "${ticketyear}-${ticketmonth}-${ticketday}",
                  //           //journey_date: "${ticketyear}%2F${ticketmonth}%2F${ticketday}",
                  //           return_date: RDate//"flightReturningDate",
                  //
                  //         )
                  //             ));
                  //
                  //
                  //


                },







                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.w, vertical: 20),
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


  // @override
  // void initState() {
  //   // TODO: implement initState
  //  // getUserDataLocation();
  //   getUserDataDomestic();
  //   super.initState();
  // }


}