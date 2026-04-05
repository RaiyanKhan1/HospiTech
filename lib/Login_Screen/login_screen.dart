import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospi_tech/Registration_Screen/RegistrationScreen.dart';

import '../Navigation_Controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

  

class _LoginScreenState extends State<LoginScreen> {

  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    

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
                                //const Color.fromARGB(255, 27, 94, 32),
                                //const Color.fromARGB(255, 76, 175, 104),
                                const Color.fromARGB(255, 76, 175, 111),
                                const Color.fromARGB(255, 43, 249, 84),

                              ], begin: AlignmentGeometry.bottomLeft,
                                  end: AlignmentGeometry.topRight),
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: ElevatedButton.icon(
                                onPressed: () async{
                                   try{
                                     await _auth.signInWithEmailAndPassword(email: usernameController.text.trim(), password: passwordController.text.trim());
                                     /*Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (context) => Navigation_Controller(),
                                       ),
                                     );*/
                                    

                                     if (mounted) {
                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder: (context) => const Navigation_Controller(),
                                      ),
                                     );
                                    }
                                   }
                                   on FirebaseAuthException catch(e)
                                  {
                                      print(e);

                              String errorMessage;

                              switch (e.code) {
                                case 'invalid-email':
                                  errorMessage = "The email address is invalid.";
                                  break;
                                case 'invalid-credential':
                                  errorMessage = "Invalid credentials. Try Again.";
                                  break;
                                case 'channel-error':
                                  errorMessage = "Enter both username and password";
                                  break;
                                default:
                                errorMessage = "An error occurred. Please try again.";
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Align(
                                  alignment: AlignmentGeometry.center,
                                  child: Text(errorMessage, style: GoogleFonts.ubuntu(),)),
                                backgroundColor: Colors.redAccent,
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                duration: const Duration(seconds: 3),
                                elevation: 5,),
                              );
                                  }


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
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                )
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02,),
                          RichText(
                              text: TextSpan(
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(text: 'New to Hospitech? '),
                                    TextSpan(text: 'Register Now!',
                                        style: TextStyle(
                                          color: const Color.fromARGB(255, 79, 189, 85),
                                        ),
                                        recognizer: TapGestureRecognizer()..onTap = () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                                        }

                                    ),
                                  ]
                              ))

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