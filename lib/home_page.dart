

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_nagair/ticket_view.dart';
import 'package:sizer/sizer.dart';
import 'bottom_nav_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{


  //final int initindx;
  final String usersName;
  final String usersID;
  final String usersToken;
  final String usersEmail;

  const HomePage({super.key, required this.usersName, required this.usersID, required this.usersToken, required this.usersEmail});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


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

    });

    //print(list?.length);

  }

  @override
  Widget build(BuildContext context) {


    getUserDataDomestic();

    // TODO: implement build
    return listDomestic!=null&&listInternational!=null?Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              SizedBox(height: 50.sp,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [

                      Text("Good morning",
                          style: TextStyle(fontSize: 17,color: Colors.grey.shade500,fontWeight: FontWeight.bold)
                      ),

                      Container(
                        width: 30.w,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text("${widget.usersName}",
                              style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),

                      SizedBox(width: 5.sp,),

                      Text("Book Tickets",
                          style: TextStyle(fontSize: 26,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold)
                      ),

                    ],
                  ),





                  Container(
                    child: Image.asset("assets/nag-air-logo.png",
                      height: 50,
                      width: 170,
                    ),
                  )


                ],
              ),


              SizedBox(height: 20,),


              InkWell(onTap:() {
                // Navigator.pop(context);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BottomBar(
                              initindx: 1,
                              usersName: widget.usersName,
                              usersToken: widget.usersToken,
                              usersID: widget.usersID,
                              usersEmail: widget.usersEmail,
                            )));

              }, child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white

                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                  child: Row(
                    children: [
                      Icon(Icons.search),

                      Text("Search for booking")
                    ],
                  )
              ),),




              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Upcoming Flight",
                    style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),
                  ),



                  InkWell(
                    onTap: (){
                      print("You are tapped");
                    },
                    child : Text("View all",
                      style: TextStyle(fontSize: 16,color: Colors.pink.shade800,fontWeight: FontWeight.w500),
                    ),)



                ],
              ),


              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                height: 32.h,
                width: 100.h,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: TicketView(
                            isColor: true,
                          )//Center(child: Text('Dummy Card Text')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Domestic Destinetions ",
                    style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),
                  ),



                  InkWell(
                    onTap: (){
                      print("You are tapped");
                    },
                    child : Text("View all",
                      style: TextStyle(fontSize: 16,color: Colors.pink.shade800,fontWeight: FontWeight.w500),
                    ),)



                ],
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                height: 210,
                width: 100.h,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listDomestic?.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                            child:  Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Image.network("${listDomestic![index]["locationImage"]}",
                                      height: 100,

                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("${listDomestic![index]["flightLocationName"]}",
                                    style: TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),
                                  ),

                                  Text("${listDomestic![index]["tickitPrice"]}",
                                      style: TextStyle(fontSize: 17,color: Color(0xFFeeedf2)/*Colors.grey.shade500*/,fontWeight: FontWeight.bold)//TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),
                                  ),

                                  SizedBox(height: 8,),


                                ],
                              ),
                            )//Center(child: Text('Dummy Card Text')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("International Flight ",
                    style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),
                  ),



                  InkWell(
                    onTap: (){
                      print("You are tapped");
                    },
                    child : Text("View all",
                      style: TextStyle(fontSize: 16,color: Colors.pink.shade800,fontWeight: FontWeight.w500),
                    ),)



                ],
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                height: 210,
                width: 100.h,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listInternational?.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                            child:  Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Image.network("${listInternational![index]["locationImage"]}",
                                      height: 100,

                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("${listInternational![index]["flightLocationName"]}",
                                    style: TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),
                                  ),

                                  Text("${listInternational![index]["tickitPrice"]}",
                                      style: TextStyle(fontSize: 17,color: Color(0xFFeeedf2)/*Colors.grey.shade500*/,fontWeight: FontWeight.bold)//TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),
                                  ),

                                  SizedBox(height: 8,),


                                ],
                              ),
                            )//Center(child: Text('Dummy Card Text')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Additional Services ",
                    style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),
                  ),



                  InkWell(
                    onTap: (){
                      print("You are tapped");
                    },
                    child : Text("View all",
                      style: TextStyle(fontSize: 16,color: Colors.pink.shade800,fontWeight: FontWeight.w500),
                    ),)



                ],
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                height: 210,
                width: 100.h,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) => Card(
                            child:  Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Image.network("https://img.freepik.com/premium-vector/car-rental-logo-template-design_316488-1614.jpg",
                                      height: 100,

                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("Car rent",
                                    style: TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),
                                  ),

                                  Text("From 250 BDT",
                                      style: TextStyle(fontSize: 17,color: Color(0xFFeeedf2)/*Colors.grey.shade500*/,fontWeight: FontWeight.bold)//TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),
                                  ),

                                  SizedBox(height: 8,),


                                ],
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
        ),
      ),
    ):Scaffold(
        body: Center(
          child: Text("Loading-----------",
            style: GoogleFonts.raleway(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),


          ),
        )
    );
  }
}