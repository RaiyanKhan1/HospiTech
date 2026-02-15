import 'dart:ui';
import 'package:flutter/material.dart';

class Equipment {
  String equipmentName;
  int equipmentAvailable;
  String equipmentImage;

  Equipment({
    required this.equipmentName,
    required this.equipmentAvailable,
    required this.equipmentImage
  });

}


List<Equipment> Equipmentlist = [
  Equipment(
    equipmentName: "Bandaid",
    equipmentAvailable: 100,
    equipmentImage: "assets/EquipmentImage/bandaid.jpg",
  ),
  Equipment(
    equipmentName: "scissors",
    equipmentAvailable: 100,
    equipmentImage: "assets/EquipmentImage/bandaid.jpg",
  ),
  Equipment(
    equipmentName: "ECG",
    equipmentAvailable: 100,
    equipmentImage: "assets/EquipmentImage/bandaid.jpg",
  ),
];