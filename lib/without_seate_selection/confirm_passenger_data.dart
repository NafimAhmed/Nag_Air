


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_nagair/without_seate_selection/ticket_confirm_page.dart';
import 'package:sizer/sizer.dart';

class ConfirmPassengerData extends StatelessWidget{

   List<TextEditingController> _controllers=[];

  DateTime date=DateTime(2023,01,1);
  final int passenger_numb;

   ConfirmPassengerData({super.key, required this.passenger_numb});




  @override
  Widget build(BuildContext context) {

    //= new List<TextEditingController>();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Passenger's data"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              child: Column(
                children: [


                  //Text("${seatList}"),



                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child:TextField(
                      maxLines: 1,
                      // controller: emailController,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: GoogleFonts.raleway(

                          ),
                          floatingLabelStyle: GoogleFonts.raleway(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,

                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          hintText: "Name",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.pink,
                                  width: 1.0
                              )
                          )
                      ),
                    ),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child:TextField(
                      maxLines: 1,
                      // controller: emailController,
                      decoration: InputDecoration(
                          labelText: "Email Address",
                          labelStyle: GoogleFonts.raleway(

                          ),
                          floatingLabelStyle: GoogleFonts.raleway(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,

                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          hintText: "Email Address",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.pink,
                                  width: 1.0
                              )
                          )
                      ),
                    ),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child:TextField(
                      maxLines: 1,
                      // controller: emailController,
                      decoration: InputDecoration(
                          labelText: "Phone Number",
                          labelStyle: GoogleFonts.raleway(

                          ),
                          floatingLabelStyle: GoogleFonts.raleway(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,

                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          hintText: "Phone Number",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.pink,
                                  width: 1.0
                              )
                          )
                      ),
                    ),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child:TextField(
                      maxLines: 1,
                      // controller: emailController,
                      decoration: InputDecoration(
                          labelText: "Destination Phone number",
                          labelStyle: GoogleFonts.raleway(

                          ),
                          floatingLabelStyle: GoogleFonts.raleway(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,

                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          hintText: "Destination Phone number",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.pink,
                                  width: 1.0
                              )
                          )
                      ),
                    ),),
                ],
              ),
            ),



            SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: passenger_numb,
                  itemBuilder: (context,int index){

                   // _controllers.add(new TextEditingController());

                    RxString newDate="Select date of birth".obs;
                    TextEditingController _controllersname=new TextEditingController();
                    _controllers.add(_controllersname);
                    return Container(

                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            width: 1,
                            color: Colors.pink,
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [

                          Text("Passenger ${index+1}"),

                          //Text("Seat Number ${seatList[index][0]}/${seatList[index][1]}"),



                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                            child:TextField(
                              maxLines: 1,
                               controller: _controllers[index],
                              decoration: InputDecoration(
                                  labelText: "Passenger Name",
                                  labelStyle: GoogleFonts.raleway(

                                  ),
                                  floatingLabelStyle: GoogleFonts.raleway(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,

                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  hintText: "Enter Passenger name",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.pink,
                                          width: 1.0
                                      )
                                  )
                              ),
                            ),),


                          //Text("Date of Birth : "),

                          Container(

                            margin: EdgeInsets.symmetric(horizontal: 25),

                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20)
                            ),

                            child: InkWell(
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




                                    Obx(() => Text("${newDate.value}",

                                      style:GoogleFonts.openSans(color: Colors.black,
                                          fontSize: 15

                                      ),

                                    ))



                                    ///////////////////////////////////////////////////////

                                  ],
                                ),
                              ),
                            ),
                          ),








                        ],
                      ),
                    );
                  }
              ),
            ),



            SizedBox(height: 30,),

            ElevatedButton(
              onPressed: () {

                // Navigator.pop(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TicketConfirmPage(
                              nameList: _controllers,
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
                "Proceed",
                style: TextStyle(color: Colors.white, fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

            SizedBox(height: 30,),



          ],
        ),
      )

    );
  }

}