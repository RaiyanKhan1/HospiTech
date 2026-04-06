import 'dart:ui';
import 'package:flutter/material.dart';

class Medicine {
  String medicineName;
  int medicineAvailable;
  String description;
  String currentLocation;


  Medicine({
    required this.medicineName,
    required this.medicineAvailable,
    required this.description,
    required this.currentLocation,
  });



}


List<Medicine> Medicinelist = [
  Medicine(
    medicineName: "Napa",
    medicineAvailable: 100,
    currentLocation: "Cabinet A, Shelf 2",
    description: "Napa is a paracetamol-based painkiller used to relieve mild to moderate pain such as headaches, toothaches, and fever. Take one tablet every 6–8 hours after meals. Do not exceed 4 tablets per day.",

  ),
  Medicine(
    medicineName: "Sergel",
    medicineAvailable: 34,
    currentLocation: "Cabinet A, Shelf 2",
    description: "Sergel is an antacid medication used to treat acidity, heartburn, and gastric ulcers. It reduces excess stomach acid and provides relief from stomach pain. Take 30 minutes before meals.",
  ),
  Medicine(
    medicineName: "Vitamin C",
    medicineAvailable: 55,
    currentLocation: "Cabinet A, Shelf 2",
    description: "Vitamin C is an essential nutrient and antioxidant that supports the immune system, promotes wound healing, and helps the body absorb iron. Take one tablet daily after a meal.",
  ),
  Medicine(
    medicineName: "Cef-3",
    medicineAvailable: 22,
    currentLocation: "Cabinet A, Shelf 2",
    description: "Cef-3 is a third-generation cephalosporin antibiotic used to treat bacterial infections including respiratory tract, urinary tract, and skin infections. Complete the full prescribed course.",
  ),
  Medicine(
    medicineName: "Vit D3",
    medicineAvailable: 12,
    currentLocation: "Cabinet A, Shelf 2",
    description: "Vitamin D3 helps the body absorb calcium and phosphorus, keeping bones and teeth strong. It also supports immune function and muscle health. Take one capsule daily with a meal.",
  ),
  Medicine(
    medicineName: "Renova",
    medicineAvailable: 54,
    currentLocation: "Cabinet A, Shelf 2",
    description: "Renova is used to improve kidney function and support the body's fluid balance. It helps manage symptoms related to kidney conditions. Take as directed by your doctor.",
  ),
];