import 'package:flutter/material.dart';

import 'Medicine.dart';
import 'Equipment.dart';

class Inventory_Page extends StatefulWidget {
  const Inventory_Page({super.key});

  @override
  State<Inventory_Page> createState() => _Inventory_PageState();
}

class _Inventory_PageState extends State<Inventory_Page> {
  int currentInventoryPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentInventoryPage == 0 ? Colors.green.withAlpha(60) :  Colors.orange.withAlpha(60),

    body: Column(
        children: [
          Divider(height: 40, thickness: 0, color: Colors.transparent),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      currentInventoryPage = 0;
                    });
                  },
                    child: Expanded(child: _AvailableMedicines())
                ),
              ),

              Expanded(
                child: GestureDetector(
                    onTap: (){
                      setState(() {
                        currentInventoryPage = 1;
                      });
                    },
                    child: Expanded(child: _AvailableEquipments())),
              ),
            ],
          ),
          Container(height: 30, color: Colors.transparent),

          Expanded(child: currentInventoryPage == 0
              ? _MedicineList()
              : _EquipmentList(),)

        ],
      ),
    );
  }

  Widget _MedicineList() {
    return Scrollbar(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: Medicinelist.length,
        itemBuilder: (context, index) {
          final medicine = Medicinelist[index];
          return Container(
            height: 100,
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  blurRadius: 10,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 0,
                    left: 35,
                    right: 35,
                  ),
                  child: Image.asset(
                    medicine.medicineImage,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                  child: Text(
                    style: TextStyle(fontSize: 20),
                    medicine.medicineName,
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        left: 20,
                        right: 0,
                      ),
                      child: Text(
                        style: TextStyle(fontSize: 20),
                        medicine.medicineAvailable.toString() + " Pc",
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                              left: 25,
                              right: 0,
                            ),
                            child: Icon(Icons.add_circle_rounded),
                          ),
                        ),

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
                              left: 5,
                              right: 0,
                            ),
                            child: Icon(Icons.remove_circle),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _AvailableMedicines() {
    int total = 0;
    for (Medicine medicine in Medicinelist) {
      total += medicine.medicineAvailable;
    }

    return Container(
      height: 100,

      margin: EdgeInsets.only(left: 20, right: 20, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 0),
            child: Icon(Icons.medication, color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 0),
                child: Text(
                  "Medicines",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                      left: 10,
                      right: 0,
                    ),
                    child: Text(
                      total.toString() + " Pc",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _EquipmentList() {
    return Scrollbar(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: Equipmentlist.length,
        itemBuilder: (context, index) {
          final medicine = Equipmentlist[index];
          return Container(
            height: 100,
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  blurRadius: 10,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                  ),
                  child: Image.asset(
                    medicine.equipmentImage,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                  child: Text(
                    style: TextStyle(fontSize: 20),
                    medicine.equipmentName,
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                      ),
                      child: Text(
                        style: TextStyle(fontSize: 15),
                        medicine.equipmentAvailable.toString() + " Units",
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                              left: 0,
                              right: 0,
                            ),
                            child: Icon(Icons.add_circle_rounded),
                          ),
                        ),

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
                              left: 5,
                              right: 0,
                            ),
                            child: Icon(Icons.remove_circle),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }



  Widget _AvailableEquipments() {
    int total = 0;
    for (Equipment equipment in Equipmentlist) {
      total += equipment.equipmentAvailable;
    }
    return Container(
      height: 100,

      margin: EdgeInsets.only(left: 20, right: 20, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 0),
            child: Icon(Icons.healing, color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 0),
                child: Text(
                  "Equipments",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                      left: 10,
                      right: 0,
                    ),
                    child: Text(
                        total.toString() + " Units",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }




}




