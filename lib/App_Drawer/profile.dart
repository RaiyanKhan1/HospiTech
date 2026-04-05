import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hospi_tech/Login_Screen/login_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  
  @override
  Widget build(BuildContext context) {
    
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //centerTitle: true,
        title: Text('Profile',
            style: GoogleFonts.archivoBlack(
              //fontWeight: FontWeight.bold,
            )
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFF5B9EFF),
                Color(0xFF4A79DD),
              ],
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: screenHeight * 0.6,),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Container(
                              width: screenWidth * 0.9,
                              height: screenHeight * 0.06,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  //const Color.fromARGB(255, 27, 94, 32),
                                  //const Color.fromARGB(255, 76, 175, 104),
                                  const Color.fromARGB(255, 243, 11, 3),
                                  const Color.fromARGB(255, 228, 42, 10),
            
                                ], begin: AlignmentGeometry.bottomLeft,
                                    end: AlignmentGeometry.topRight),
                                borderRadius: BorderRadius.circular(10),
            
                              ),
                              child: ElevatedButton.icon(
                                  onPressed: () async{
                                    FirebaseAuth.instance.signOut();

                                    if (mounted) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                                        (route) => false,
                                        );
                                        }
                                  },
                                  label: Text('LOGOUT',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  icon: Icon(Icons.logout, size: 20,),
                                  //iconAlignment: IconAlignment.start,
                                  style: ElevatedButton.styleFrom(
            
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                  )
                              ),
                            ),
          ),
        ],
      ),
      );
  }
}