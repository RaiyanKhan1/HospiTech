import 'package:flutter/material.dart';
import 'PatientCard.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  final List<Map<String, dynamic>> patients = [
    {
      'name': 'Joy',
      'age': 30,
      'gender': 'MALE',
      'admittedDate': '9/11/25',
    },
    {
      'name': 'Munia',
      'age': 23,
      'gender': 'Female',
      'admittedDate': '10/11/26',
    },
  ];

  int get totalPatients => patients.length;

  void releasePatient(int index) {
    setState(() {
      patients.removeAt(index);
    });
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
              padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '$totalPatients',
                    style: const TextStyle(
                      color: Colors.white,
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
                    name: patient['name'],
                    age: patient['age'],
                    gender: patient['gender'],
                    admittedDate: patient['admittedDate'],
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
