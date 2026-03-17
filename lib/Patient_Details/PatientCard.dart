import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  final String name;
  final int age;
  final String gender;
  final String admittedDate;
  final VoidCallback? onRelease;

  const PatientCard({
    super.key,
    required this.name,
    required this.age,
    required this.gender,
    required this.admittedDate,
    this.onRelease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [

            Color(0xFF5B9EFF),
            Color(0xFF4A79DD),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${age}Y  $gender',
            style: const TextStyle(
                color: Colors.white70,
              fontSize: 10,

            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Icon(Icons.description_outlined, color: Colors.white, size: 24),
              SizedBox(width: 20),
              Icon(Icons.edit_outlined, color: Colors.white, size: 24),
              SizedBox(width: 20),
              Icon(Icons.show_chart, color: Colors.white, size: 24),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Admitted : $admittedDate',
                style: const TextStyle(
                    color: Colors.white70,
                  fontSize: 10,
                ),
              ),
              TextButton(
                onPressed: onRelease,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white24,
                ),
                child: const Text(
                  'release',
                  style: TextStyle(
                      color: Colors.white,
                       fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

