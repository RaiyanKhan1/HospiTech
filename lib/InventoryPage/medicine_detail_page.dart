import 'package:flutter/material.dart';
import 'Medicine.dart';

class MedicineDetailPage extends StatelessWidget {
  final Medicine medicine;

  const MedicineDetailPage({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FF),

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.medication,
                      color: Color(0xFF1565C0),
                      size: 36,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    medicine.medicineName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        color: Color(0xFF1565C0),
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Available",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      Spacer(),
                      Text(
                        medicine.medicineAvailable.toString() +"Pc",
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),

                  Divider(height: 24),

                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xFF1565C0),
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Currently at Level",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      Spacer(),
                      Text(
                        medicine.currentLocation.isEmpty
                            ? "Not set"
                            : medicine.currentLocation,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 140),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    medicine.description.isEmpty
                        ? "No description available."
                        : medicine.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
