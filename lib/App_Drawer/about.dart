import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //centerTitle: true,
        title: Text('About',
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
      body: Center(
        child: Text('App Version: 1.0.0',
        style: GoogleFonts.ubuntu(
          fontSize: 14,
        ),),
      ),
      );
  }
}