import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospi_tech/Add_Patient/Patient.dart';


class ArchivedPage extends StatefulWidget {
  final List<Patient> archivedPatients;

  const ArchivedPage({super.key, required this.archivedPatients});

  @override
  State<ArchivedPage> createState() => _ArchivedPageState();
}

class _ArchivedPageState extends State<ArchivedPage> {
  String _formatDate(DateTime d) => '${d.day}/${d.month}/${d.year}';

  void _viewImage(BuildContext context, String path, String title) {
    final file = File(path);

    if (!file.existsSync()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$title not found'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            InteractiveViewer(
              child: Image.file(file, fit: BoxFit.contain),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
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
        leading: const BackButton(color: Colors.white),
        title: Text(
          'Archived Patients',
          style: GoogleFonts.archivoBlack(fontSize: 18, color: Colors.white),
        ),
      ),
      body: widget.archivedPatients.isEmpty
          ? const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.archive_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 12),
            Text(
              'No archived patients yet',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: widget.archivedPatients.length,
        itemBuilder: (context, i) => _ArchivedCard(
          patient: widget.archivedPatients[i],
          onViewImage: (path, title) =>
              _viewImage(context, path, title),
          formatDate: _formatDate,
        ),
      ),
    );
  }
}

class _ArchivedCard extends StatelessWidget {
  final Patient patient;
  final void Function(String path, String title) onViewImage;
  final String Function(DateTime) formatDate;

  const _ArchivedCard({
    required this.patient,
    required this.onViewImage,
    required this.formatDate,
  });

  @override
  Widget build(BuildContext context) {
    final hasPrescription = patient.prescriptionPath?.isNotEmpty == true;
    final hasReport = patient.reportPath?.isNotEmpty == true;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  patient.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF4A79DD),
                  ),
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EFFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Released',
                    style: TextStyle(
                      color: Color(0xFF4A79DD),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),
            Text(
              '${patient.age}Y • ${patient.gender}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const Divider(height: 16),

            // Info rows
            _infoRow(Icons.phone, patient.phoneNumber),
            _infoRow(Icons.person_outline, 'Dr. ${patient.assignedDoctor}'),
            _infoRow(Icons.favorite_border, patient.healthCondition),
            _infoRow(
              Icons.calendar_today_outlined,
              'Admitted: ${formatDate(patient.dateAdmitted)}',
            ),

            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _fileButton(
                    context: context,
                    label: 'Prescription',
                    icon: Icons.description_outlined,
                    active: hasPrescription,
                    onTap: hasPrescription
                        ? () => onViewImage(
                      patient.prescriptionPath!,
                      'Prescription — ${patient.name}',
                    )
                        : null,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _fileButton(
                    context: context,
                    label: 'Report',
                    icon: Icons.show_chart,
                    active: hasReport,
                    onTap: hasReport
                        ? () => onViewImage(
                      patient.reportPath!,
                      'Report — ${patient.name}',
                    )
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.grey),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fileButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required bool active,
    VoidCallback? onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 14),
      label: Text(label, style: const TextStyle(fontSize: 12)),
      style: ElevatedButton.styleFrom(
        backgroundColor:
        active ? const Color(0xFF5B9EFF) : Colors.grey[300],
        foregroundColor: active ? Colors.white : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
      ),
    );
  }
}