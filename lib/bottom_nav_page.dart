


import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'profile_page.dart';
import 'search_page.dart';
import 'ticket_screen.dart';

class BottomBar extends StatelessWidget{

  final int initindx;



  static final List<Widget> _widgetOptions =<Widget>[

     HomePage(),
    SearchPage(),
    TicketScreen(),

     ProfilePage(),

  ];

   BottomBar({super.key, required this.initindx});

  RxInt setSelectedIndex=0.obs;



   void onItemTapped(int index){

    setSelectedIndex.value=index;

    // setState((){
    //   setSelectedIndex=index;
    //
    // });

  }



  @override
  Widget build(BuildContext context) {
    setSelectedIndex.value=initindx;
    // TODO: implement build
    return Obx(() => Scaffold(
      // appBar: AppBar(
      //   title: Text("My ticket"),
      // ),

      body: Container(
          child: Center(
            child: _widgetOptions[setSelectedIndex.value],
          )
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: setSelectedIndex.value,
        onTap: onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.pink.shade800,
        items: [
          BottomNavigationBarItem(

              activeIcon: Icon(FluentIcons.home_12_filled),
              icon: Icon(FluentIcons.home_12_regular, size: 30,),
              label: "Home"
          ),

          BottomNavigationBarItem(
            activeIcon: Icon(FluentIcons.airplane_20_filled),
            icon: Icon(FluentIcons.airplane_20_regular, size: 30,),label: "Book",),

          BottomNavigationBarItem(activeIcon: Icon(FluentIcons.ticket_horizontal_20_filled),
              icon: Icon(FluentIcons.ticket_horizontal_20_regular, size: 30,),label: "Ticket"),
          BottomNavigationBarItem(activeIcon: Icon(FluentIcons.person_20_filled),
              icon: Icon(FluentIcons.person_5_20_regular, size: 30,),label: "Profile"),
        ],
      ),
    ));
  }

}