import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hospi_tech/Add_Patient/Patient.dart';

class NewPatient extends StatefulWidget {
  const NewPatient({super.key});

  @override
  State<NewPatient> createState() => _NewPatientState();
}

class _NewPatientState extends State<NewPatient> {


  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final doctorController = TextEditingController();
  final healthconditionController = TextEditingController();

  final imagePicker = ImagePicker();
  String? prescriptionPath;
  String? reportPath;

  pickImage (int a) async { //image picking function
    final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image!= null){
      setState(() {
        if(a==1){
          prescriptionPath = image.path;
        } else {
          reportPath = image.path;
        }
      });
    }
  }

  savePatient() {
    final newPatient = Patient(
        name: nameController.text,
        age: int.tryParse(ageController.text) ?? 0,
        gender: genderController.text,
        phoneNumber: phoneController.text,
        assignedDoctor: doctorController.text,
        healthCondition: healthconditionController.text,
        dateAdmitted: DateTime.now(),
        prescriptionPath: prescriptionPath,
        reportPath: reportPath
    );

    print("Patient Object Created: ${newPatient.name}"); //just for checking

  }



  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 15, right: 15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => const LinearGradient(
                      /*colors: [Color(0xFF00E676),
                        Color(0xFF69F0AE),
                        Color(0xFF00E676),]*/
                        colors: [
                          //Color(0xFF2CF194),
                          //Color(0xFF81DD84),
                          //Color(0xFF1ACC74),
                          //Color(0xFF8CEF46),
                          Color(0xFF5B9EFF),
                          Color(0xFF4A79DD),
                        ]
                    ).createShader(bounds),
                    child: Text('Add\nPatient',

                        textAlign: TextAlign.left,
                        style: GoogleFonts.archivoBlack(
                          height: 0.9,
                          //color: Colors.green,
                          fontSize: 60,
                        )
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.05),


              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  margin: EdgeInsets.only(bottom: screenHeight * 0.1),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          /*Color(0xFF2CF194),
                              Color(0xFF0FCA4A),
                              Color(0xFFA2ED0C),*/
                          Color(0xFF5B9EFF),
                          Color(0xFF4A79DD),
                        ],

                        begin: AlignmentGeometry.bottomCenter,
                        end: AlignmentGeometry.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        inputField(controller: nameController, hint: 'Enter Name'),
                        SizedBox(height: screenHeight * 0.005,),
                        Row(
                            children: [
                              Expanded(
                                child: inputField(controller: ageController, hint: 'Age', keyboardType: TextInputType.number),
                              ),

                              const SizedBox(width: 15,),
                              Expanded(
                                child: inputField(controller: genderController, hint: 'Gender'),

                              ),

                            ]
                        ),
                        SizedBox(height: screenHeight * 0.005,),

                        inputField(controller: phoneController, hint: 'Phone Number'),
                        SizedBox(height: screenHeight * 0.005,),

                        inputField(controller: doctorController, hint: 'Assigned Doctor'),
                        SizedBox(height: screenHeight * 0.005,),

                        inputField(controller: healthconditionController, hint: 'Health Condition'),
                        SizedBox(height: screenHeight * 0.005,),

                        FractionallySizedBox(
                          widthFactor: 0.75,
                          child: ElevatedButton.icon(
                              onPressed: () {
                                pickImage(1);
                              },
                              //label: Text('Upload Prescription'),
                              //label: prescriptionPath == null? Text('Upload Prescription') : Text('Prescription Added'),
                              label: Row(
                                children: [
                                  prescriptionPath == null? Text('Upload Prescription') : Text('Prescription Added'),
                                  const SizedBox(width: 5),
                                  if(prescriptionPath != null)
                                    Icon(Icons.check_circle_outline_rounded,
                                      color: Colors.green,
                                      size: 20,),
                                ],
                              ),
                              icon: Icon(Icons.note_add_outlined),
                              iconAlignment: IconAlignment.start,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.grey,
                              )
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.005,),

                        FractionallySizedBox(
                          widthFactor: 0.75,
                          child: ElevatedButton.icon(
                              onPressed: () {
                                pickImage(2);
                              },
                              //label: Text('Upload Report'),
                              //label: reportPath == null? Text('Upload Report') : Text('Report Added'),
                              label: Row(
                                children: [
                                  reportPath == null? Text('Upload Report') : Text('Report Added'),
                                  const SizedBox(width: 5),
                                  if(reportPath != null)
                                    Icon(Icons.check_circle_outline_rounded,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                ],
                              ),
                              icon: Icon(Icons.note_add_outlined),
                              iconAlignment: IconAlignment.start,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.grey,
                              )
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton.icon(

                              onPressed: () {
                                savePatient(); //call save_patient and create patient object
                              },
                              label: Text('SAVE'),
                              icon: Icon(Icons.person_add_alt_outlined),
                              iconAlignment: IconAlignment.start,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blue,
                              )
                          ),
                        ),

                      ],
                    ),
                  ),
                ),


              )

            ],
          ),
        )
    );
  }
}

Widget inputField({required TextEditingController controller, required String hint, TextInputType keyboardType = TextInputType.text}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(15))),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        suffix: IconButton(
            onPressed: () {
              controller.clear();
            },
            icon: Icon(Icons.clear))
    ),
  );
}


