import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospi_tech/Add_Patient/Patient.dart';
import 'InventoryPage/Inventory_Page.dart';
import 'Patient_Details/Patient_List.dart';
import 'Add_Patient/new_patient.dart';
import 'Patient_Details/ArchivedPage.dart';

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
List<String> navTitle = [ "Details" , "Add Patient", "Inventory"];

final List<Patient> sharedArchivedPatients = [];

class _Navigation_ControllerState extends State<Navigation_Controller> {
  int selectedNavIndex = 2;

  final GlobalKey<PatientListScreenState> _patientListKey = GlobalKey<PatientListScreenState>();
  late final List<Widget> pages;
  @override
  void initState() {
    super.initState();
    pages = [
      PatientListScreen(
        key: _patientListKey,
        archivedPatients: sharedArchivedPatients,
      ),
      const Inventory_Page(),
    ];
  }

  Future<void> _openAddPatient() async {
    final Patient? newPatient = await Navigator.push<Patient>(
      context,
      MaterialPageRoute(
        builder: (_) => _AddPatientWithNavBar(
          archivedPatients: sharedArchivedPatients,
          onNavTap: (index) => setState(() => selectedNavIndex = index),
        ),
      ),
    );
    if (newPatient != null) {
      _patientListKey.currentState?.addPatient(newPatient);
      setState(() => selectedNavIndex = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('HOSPITECH', style: GoogleFonts.archivoBlack()),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFF5B9EFF), Color(0xFF4A79DD)],
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Username', style: GoogleFonts.archivo()),
              accountEmail: Text('Email', style: GoogleFonts.archivo()),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xFF5B9EFF), Color(0xFF4A79DD)],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: Text('Profile', style: GoogleFonts.archivo()),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings_rounded),
              title: Text('Settings', style: GoogleFonts.archivo()),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text('About', style: GoogleFonts.archivo()),
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
                    builder: (_) => ArchivedPage(
                      archivedPatients: sharedArchivedPatients,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          pages[selectedNavIndex == 2 ? 1 : 0],
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: navIcon.map((icon) {
          int index = navIcon.indexOf(icon);
          bool isSelected = selectedNavIndex == index;
          return Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                if (index == 1) {
                  _openAddPatient();
                } else {
                  setState(() => selectedNavIndex = index);
                }
              },
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20, left: 35, right: 35),
                    child: Icon(icon,
                        color: isSelected ? Colors.blue : Colors.grey),
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

class _AddPatientWithNavBar extends StatefulWidget {
  final List<Patient> archivedPatients;
  final void Function(int index) onNavTap;

  const _AddPatientWithNavBar({
    required this.archivedPatients,
    required this.onNavTap,
  });

  @override
  State<_AddPatientWithNavBar> createState() => _AddPatientWithNavBarState();
}

class _AddPatientWithNavBarState extends State<_AddPatientWithNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('HOSPITECH', style: GoogleFonts.archivoBlack()),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFF5B9EFF), Color(0xFF4A79DD)],
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          const NewPatient(),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: navIcon.map((icon) {
          int index = navIcon.indexOf(icon);
          bool isSelected = index == 1;
          return Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                widget.onNavTap(index);
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20, left: 35, right: 35),
                    child: Icon(icon,
                        color: isSelected ? Colors.blue : Colors.grey),
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