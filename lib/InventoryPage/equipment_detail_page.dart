import 'package:flutter/material.dart';
import 'Equipment.dart';

class EquipmentDetailPage extends StatelessWidget {
  final Equipment equipment;

  const EquipmentDetailPage({super.key, required this.equipment});

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
              width: double.infinity,
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
                      Icons.healing,
                      color: Color(0xFF1565C0),
                      size: 36,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    equipment.equipmentName,
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
                        equipment.equipmentAvailable.toString() + "Pc",
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
                        equipment.currentLocation.isEmpty
                            ? "Not set"
                            : equipment.currentLocation,
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
                    equipment.description.isEmpty
                        ? "No description available."
                        : equipment.description,
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
