import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/RegisterScreenImage/register.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "REGISTER",
                          style: GoogleFonts.ubuntu(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Create an account to get started",
                          style: GoogleFonts.ubuntu(color: Colors.black),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: const Color.fromARGB(255, 139, 139, 139)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.all(5),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),

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
                      SizedBox(height: screenHeight * 0.01),


                      TextField(
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.fingerprint_outlined),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: const Color.fromARGB(255, 139, 139, 139)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.all(5),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                            onPressed: () =>
                                setState(() => _obscurePassword = !_obscurePassword),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      Container(
                        width: double.infinity,
                        height: screenHeight * 0.06,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 76, 175, 111),
                              const Color.fromARGB(255, 43, 249, 84),

                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () async{
                            try{
                              await _auth.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Align(
                                    alignment: AlignmentGeometry.center,
                                    child: Text("Registration Successful!", style: GoogleFonts.ubuntu(),)),
                                  backgroundColor: Colors.green, // Green for success
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                  duration: Duration(seconds: 2),
                                  ),
                                  );
                                  
                                  await Future.delayed(Duration(seconds: 1));
                                  if (mounted) Navigator.of(context).pop();
                            }
                            on FirebaseAuthException catch (e){
                              print(e);
                              String errorMessage;

                              switch (e.code) {
                                case 'weak-password':
                                  errorMessage = "Password should be at least 6 characters";
                                  break;
                                case 'email-already-in-use':
                                  errorMessage = "Account already exists for that email.";
                                  break;
                                case 'invalid-email':
                                  errorMessage = "The email address is invalid.";
                                  break;
                                case 'channel-error':
                                  errorMessage = "Provide all the required information";
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
                                elevation: 6,),
                              );
                            }

                          },
                          label: Text(
                            'REGISTER',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: Icon(Icons.app_registration_outlined, size: 20),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            elevation: 0,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),

                    ],
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