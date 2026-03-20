import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hospi_tech/Add_Patient/Patient.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  final VoidCallback? onRelease;

  const PatientCard({
    super.key,
    required this.patient,
    this.onRelease,
  });

  String _formatDate(DateTime d) => '${d.day}/${d.month}/${d.year}';

  void _viewImage(BuildContext context, String path, String title) {
    final file = File(path);
    if (!file.existsSync()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$title not found'), backgroundColor: Colors.red),
      );
      return;
    }
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            InteractiveViewer(child: Image.file(file, fit: BoxFit.contain)),
            Positioned(
              top: 10, right: 10,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasPrescription = patient.prescriptionPath?.isNotEmpty == true;
    final hasReport = patient.reportPath?.isNotEmpty == true;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
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
            patient.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${patient.age}Y  ${patient.gender}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: hasPrescription
                    ? () => _viewImage(context, patient.prescriptionPath!, 'Prescription')
                    : null,
                icon: Icon(
                  Icons.description_outlined,
                  color: hasPrescription ? Colors.white : Colors.white38,
                  size: 24,
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: hasReport
                    ? () => _viewImage(context, patient.reportPath!, 'Report')
                    : null,
                icon: Icon(
                  Icons.show_chart,
                  color: hasReport ? Colors.white : Colors.white38,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Admitted : ${_formatDate(patient.dateAdmitted)}',
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