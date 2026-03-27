import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:hospi_tech/Add_Patient/Patient.dart';

import 'PatientCard.dart';
import 'package:hospi_tech/Add_Patient/new_patient.dart';

class PatientListScreen extends StatefulWidget {

  const PatientListScreen({
    super.key,
  });

  @override
  PatientListScreenState createState() => PatientListScreenState();
}

class PatientListScreenState extends State<PatientListScreen> {
  List<Patient> patients = [
  ];

  int get totalPatients => patients.length;

  void releasePatient(int index) {
    final patientBox = Hive.box('PatientsBox');
    final archivedBox = Hive.box('ArchivedBox');
    final patientData = patientBox.getAt(index);
    archivedBox.add(patientData);
    patientBox.deleteAt(index);
    setState(() {
      LoadPatients();
    });
  }
   void LoadPatients() {
    final box = Hive.box('PatientsBox');
    patients = box.keys.map((key) => Patient.fromJson(Map<String, dynamic>.from(box.get(key)))).toList();
  }
  @override
  void initState() {

    super.initState();
    LoadPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TOTAL PATIENTS:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '$totalPatients',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  final patient = patients[index];
                  return PatientCard(
                    patient: patient,
                    onRelease: () => releasePatient(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}