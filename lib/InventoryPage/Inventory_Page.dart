import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'Medicine.dart';
import 'Equipment.dart';
import 'equipment_detail_page.dart';
import 'medicine_detail_page.dart';

class Inventory_Page extends StatefulWidget {
  const Inventory_Page({super.key});

  @override
  State<Inventory_Page> createState() => _Inventory_PageState();

}

class _Inventory_PageState extends State<Inventory_Page> {
  int currentInventoryPage = 0;

  @override

  @override
  Widget build(BuildContext context) {



    return Container(
      decoration: BoxDecoration(color: Color(0xFFF5F7FF)),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Column(
                children: [
                  _TopTotalCount(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentInventoryPage = 0;
                            });
                          },
                          child: Expanded(child: _MedicinesTab()),
                        ),
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentInventoryPage = 1;
                            });
                          },
                          child: Expanded(child: _EquipmentsTab()),
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: currentInventoryPage == 0
                        ? _MedicineList()
                        : _EquipmentList(),
                  ),
                ],
              ),

      ),
    );
  }

  Widget _TopTotalCount(){

    int totalMed = 0;
    for (Medicine medicine in Medicinelist) {
      totalMed += medicine.medicineAvailable;
    }

    int totalEqui = 0;
    for (Equipment equipment in Equipmentlist) {
      totalEqui += equipment.equipmentAvailable;
    }


    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

    Expanded(
      child: Container(
        margin: EdgeInsets.all(10 ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Medicines",
      style: TextStyle(fontSize: 11, color: Colors.grey[500],
      letterSpacing: 0.6)),
      const SizedBox(height: 4),
      RichText(text: TextSpan(
      style: const TextStyle(color: Colors.black),
      children: [
      TextSpan(text: totalMed.toString(),
      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
      TextSpan(text: "pc",
      style: TextStyle(fontSize: 13, color: Colors.grey[500])),
      ],
      )),
      ]),
      ),
    ),

        Expanded(
          child: Container(
            margin: EdgeInsets.all(10 ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Equipments",
                  style: TextStyle(fontSize: 11, color: Colors.grey[500],
                      letterSpacing: 0.6)),
              const SizedBox(height: 4),
              RichText(text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: totalEqui.toString(),
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
                  TextSpan(text: "pc",
                      style: TextStyle(fontSize: 13, color: Colors.grey[500])),
                ],
              )),
            ]),
          ),
        ),


      ],
    );
  }

  Widget _MedicineList() {
    return Column(
      children: [
        Expanded(
          child: Scrollbar(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: Medicinelist.length,
              itemBuilder: (context, index) {
                final medicine = Medicinelist[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to the detail page and pass the medicine object
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MedicineDetailPage(medicine: medicine,),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                  
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 0),
                          child: Row(
                            children: [
                              Container(
                                width: 40, height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE3F2FD),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.medication,
                                    color: Color(0xFF1565C0), size: 20),
                              ),
                              SizedBox(width: 12),
                              Text(
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
                                medicine.medicineName,
                              ),
                            ],
                          ),
                        ),
                  
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(
                                  top: 0,
                                  bottom: 0,
                                  left: 45,
                                  right: 0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                      medicine.medicineAvailable.toString(),
                                    ),
                                    Text(
                                      style: TextStyle(fontSize: 14),
                                      " Pc",
                                    ),
                                  ],
                                )
                              ),
                  
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        medicine.medicineAvailable--;
                                      });
                                    },
                  
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 0,
                                        bottom: 0,
                                        left: 25,
                                        right: 0,
                                      ),
                                      child: Container(
                                        width: 28, height: 28,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF4F6FA),
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: Colors.grey.shade300),
                                        ),
                                        child: Icon(Icons.remove, size: 16, color: Colors.grey[600]),
                                      ),
                                    ),
                                  ),
                  
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        medicine.medicineAvailable++;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 0,
                                        bottom: 0,
                                        left: 5,
                                        right: 0,
                                      ),
                                      child:  Container(
                                        width: 28, height: 28,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF4F6FA),
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: Colors.grey.shade300),
                                        ),
                                        child: Icon(Icons.add, size: 16, color: Colors.grey[600]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

          ),
        ),
        SizedBox(height: 140,),
      ],
    );
  }

  Widget _MedicinesTab() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 40,

      margin: EdgeInsets.only(left: screenWidth/8, right: 5, bottom: 0, top: 0),
      decoration: BoxDecoration(
        color: currentInventoryPage == 1 ? Colors.grey : Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
            child: Icon(Icons.medication, color: Colors.white),
          ),

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 0, bottom: 0, left: 5, right: 0),
            child: Text(
              "Medicines",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _EquipmentList() {
    return Column(
      children: [
        Expanded(
          child: Scrollbar(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: Equipmentlist.length,
              itemBuilder: (context, index) {
                final medicine = Equipmentlist[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EquipmentDetailPage(equipment: medicine),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 0),
                          child: Row(
                            children: [
                              Container(
                                width: 40, height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE3F2FD),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.healing,
                                    color: Color(0xFF1565C0), size: 20),
                              ),
                              SizedBox(width: 12),
                              Text(
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
                                medicine.equipmentName,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(
                                    top: 0,
                                    bottom: 0,
                                    left: 45,
                                    right: 0,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                                        medicine.equipmentAvailable.toString(),
                                      ),
                                      Text(
                                        style: TextStyle(fontSize: 14),
                                        " Pc",
                                      ),
                                    ],
                                  )
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        medicine.equipmentAvailable--;
                                      });
                                    },

                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 0,
                                        bottom: 0,
                                        left: 25,
                                        right: 0,
                                      ),
                                      child: Container(
                                        width: 28, height: 28,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF4F6FA),
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: Colors.grey.shade300),
                                        ),
                                        child: Icon(Icons.remove, size: 16, color: Colors.grey[600]),
                                      ),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        medicine.equipmentAvailable++;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 0,
                                        bottom: 0,
                                        left: 5,
                                        right: 0,
                                      ),
                                      child:  Container(
                                        width: 28, height: 28,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF4F6FA),
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: Colors.grey.shade300),
                                        ),
                                        child: Icon(Icons.add, size: 16, color: Colors.grey[600]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

          ),
        ),
        SizedBox(height: 140,),
      ],
    );
  }

  Widget _EquipmentsTab() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 40,

      margin: EdgeInsets.only(left: 5, right: screenWidth/8, bottom: 0, top: 0),
      decoration: BoxDecoration(
        color: currentInventoryPage == 0 ? Colors.grey : Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
            child: Icon(Icons.healing, color: Colors.white),
          ),

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 0, bottom: 0, left: 5, right: 0),
            child: Text(
              "Equipments",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
