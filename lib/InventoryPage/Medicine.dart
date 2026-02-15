import 'dart:ui';
import 'package:flutter/material.dart';

class Medicine {
  String medicineName;
  int medicineAvailable;
  String medicineImage;

  Medicine({
    required this.medicineName,
    required this.medicineAvailable,
    required this.medicineImage
  });

}


List<Medicine> Medicinelist = [
  Medicine(
    medicineName: "Napa",
    medicineAvailable: 100,
    medicineImage: "assets/MedicineImages/napa.jpg",
  ),
  Medicine(
    medicineName: "Sergel",
    medicineAvailable: 100,
    medicineImage: "assets/MedicineImages/sergel.jpg",
  ),
  Medicine(
    medicineName: "Sergel",
    medicineAvailable: 100,
    medicineImage: "assets/MedicineImages/sergel.jpg",
  ),
  Medicine(
    medicineName: "Sergel",
    medicineAvailable: 100,
    medicineImage: "assets/MedicineImages/sergel.jpg",
  ),
  Medicine(
    medicineName: "Sergel",
    medicineAvailable: 100,
    medicineImage: "assets/MedicineImages/sergel.jpg",
  ),
  Medicine(
    medicineName: "Sergel",
    medicineAvailable: 100,
    medicineImage: "assets/MedicineImages/sergel.jpg",
  ),
];