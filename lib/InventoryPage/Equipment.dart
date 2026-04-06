import 'dart:ui';
import 'package:flutter/material.dart';

class Equipment {
  String equipmentName;
  int equipmentAvailable;
  String description;
  String currentLocation;


  Equipment({
    required this.equipmentName,
    required this.equipmentAvailable,
    required this.description,
    required this.currentLocation,
  });

}


List<Equipment> Equipmentlist = [
  Equipment(
    equipmentName: "Band-Aid",
    equipmentAvailable: 100,
    currentLocation: "Cabinet B, Shelf 1",
    description: "Band-Aid is an adhesive bandage used to cover small cuts, wounds, and blisters. It protects the wound from dirt and infection. Available in various sizes. Replace daily or when wet.",
  ),
  Equipment(
    equipmentName: "Scissors",
    equipmentAvailable: 78,
    currentLocation: "Drawer 3, Room 2",
    description: "Medical scissors are used to cut bandages, tape, and surgical materials. Stainless steel blades ensure durability and easy sterilization. Clean with alcohol after each use.",
  ),
  Equipment(
    equipmentName: "ECG",
    equipmentAvailable: 35,
    currentLocation: "ICU, Floor 2",
    description: "An ECG machine records the electrical activity of the heart over a period of time. Used to detect heart conditions such as arrhythmia and heart attacks. Requires trained staff to operate.",
  ),
];