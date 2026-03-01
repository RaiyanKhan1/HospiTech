import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Navigation_Controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    final usernameController = new TextEditingController();
    final passwordController = new TextEditingController();

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: double.infinity,
                    height: screenHeight * 0.45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/LoginScreenImage/hexagon.png"),
                        fit: BoxFit.contain,
                      ),
                    ),


                  ),
                ),
                SizedBox(height: screenHeight * 0.02,),
                Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: Container(
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: Text("WELCOME",
                              style: GoogleFonts.googleSans(
                                  fontSize: 50,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700 ),),
                          ),
                          Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child:Text("Login to get started",
                              style: GoogleFonts.ubuntu(
                                color: Colors.black,
                              ),
                            ),
                          ),

                          SizedBox(height: screenHeight * 0.02,),
                          TextField(

                            controller: usernameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle_outlined),
                              hintText: 'Username',
                              hintStyle: TextStyle(color: const Color.fromARGB(255, 139, 139, 139)),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.all(5),


                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01,),
                          TextField(

                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.fingerprint_outlined),
                              hintText: 'Password',

                              hintStyle: TextStyle(color: const Color.fromARGB(255, 139, 139, 139)),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.all(5),

                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02,),

                          Container(
                            width: double.infinity,
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                const Color.fromARGB(255, 27, 94, 32),
                                const Color.fromARGB(255, 76, 175, 104),

                              ], begin: AlignmentGeometry.bottomLeft,
                                  end: AlignmentGeometry.topRight),
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Navigation_Controller(),
                                      ),
                                  );

                                },
                                label: Text('LOGIN',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                icon: Icon(Icons.arrow_circle_right_outlined, size: 20,),
                                //iconAlignment: IconAlignment.start,
                                style: ElevatedButton.styleFrom(

                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                                  elevation: 0,
                                )
                            ),
                          ),

                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget TextInputField({required TextEditingController controller, required String hint, }){
  return TextField(

  );
}