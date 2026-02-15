import 'package:flutter/material.dart';

import 'InventoryPage/Inventory_Page.dart';
import 'Patient_Details/Patient_List.dart';
class Navigation_Controller extends StatefulWidget {
  const Navigation_Controller({super.key});

  @override
  State<Navigation_Controller> createState() => _Navigation_ControllerState();
}

List<IconData> navIcon = [
  Icons.accessible,
  Icons.person_add_alt,
  Icons.inventory_2_outlined,
];

List<String> navTitle = ["Details", "Add Patient", "Inventory"];

int selectedNavIndex = 2;

List<Widget> pages = [
  PatientListScreen(),
  Container(color: Colors.red,),
  Inventory_Page(),
];

class _Navigation_ControllerState extends State<Navigation_Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [

          pages[selectedNavIndex],
          Align(alignment: Alignment.bottomCenter, child: _navBar()),
        ],
      ),
    );
  }

  Widget _navBar() {
    return Container(
      height: 65,
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(29),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: navIcon.map((icon) {
          int index = navIcon.indexOf(icon);
          bool isSelected = selectedNavIndex == index;
          return Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedNavIndex = index;
                });
              },

                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 0,
                        left: 35,
                        right: 35,
                      ),
                      child: Icon(
                        icon,
                        color: isSelected ? Colors.blue : Colors.grey,
                      ),
                    ),
                    Text(
                      navTitle[index],
                      style: TextStyle(
                        color: isSelected ? Colors.blue : Colors.grey,
                        fontSize: 9,
                      ),
                    ),

                  ],
                ),
              ),

          );
        }).toList(),
      ),
    );
  }
}
