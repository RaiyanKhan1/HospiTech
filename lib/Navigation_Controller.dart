import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospi_tech/Add_Patient/Patient.dart';
import 'package:hospi_tech/Login_Screen/login_screen.dart';

import 'InventoryPage/Inventory_Page.dart';
import 'Patient_Details/ArchivedPage.dart';
import 'Patient_Details/Patient_List.dart';
import 'Add_Patient/new_patient.dart';

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
  PatientListScreen(archivedPatients: [],),
  NewPatient(),
  Inventory_Page(),
];

class _Navigation_ControllerState extends State<Navigation_Controller> {
  List<Patient> get sharedArchivedPatients => [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('HOSPITECH',
            style: GoogleFonts.archivoBlack(
              //fontWeight: FontWeight.bold,
            )
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFF5B9EFF),
                Color(0xFF4A79DD),
              ],
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      drawer: Drawer( //app drawer
          child: Container(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Username', style: GoogleFonts.archivo(),),
                  accountEmail: Text('Email', style: GoogleFonts.archivo(),),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xFF5B9EFF),
                        Color(0xFF4A79DD),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile',
                    style: GoogleFonts.archivo(),),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings_rounded,),
                  title: Text('Settings',
                    style: GoogleFonts.archivo(),),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About',
                    style: GoogleFonts.archivo(),),
                  onTap: () {},
                ),
                ListTile(
                    leading: const Icon(Icons.archive_outlined),
                    title: Text('Archived', style: GoogleFonts.archivo()),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ArchivedPage(
                                archivedPatients: sharedArchivedPatients,
                              ),
                        ),
                      );

                    }
                ),

              ],
            ),
          )
      ),
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
