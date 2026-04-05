import 'dart:ui';
import 'package:flutter/material.dart';

class Medicine {
  String medicineName;
  int medicineAvailable;


  Medicine({
    required this.medicineName,
    required this.medicineAvailable,

  });



}


List<Medicine> Medicinelist = [
  Medicine(
    medicineName: "Napa",
    medicineAvailable: 100,

  ),
  Medicine(
    medicineName: "Sergel",
    medicineAvailable: 34,

  ),
  Medicine(
    medicineName: "Vitamin C",
    medicineAvailable: 55,

  ),
  Medicine(
    medicineName: "Cef-3",
    medicineAvailable: 22,

  ),
  Medicine(
    medicineName: "Vit D3",
    medicineAvailable: 12,

  ),
  Medicine(
    medicineName: "Renova",
    medicineAvailable: 54,

  ),
];