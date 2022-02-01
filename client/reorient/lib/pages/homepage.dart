import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reorient/widgets/GradientButton.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                width: 120,
                height: 137,
                image: AssetImage("assets/runner.png"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 8.0),
                child: SizedBox(
                  width: 220,
                  child: Text(
                    "Chosen just for you.",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 220,
                child: Text(
                  "Discover new hobbies. Properly",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.normal,
                    color: const Color(0x63000000),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: GradientButton(
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  width: 200,
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color(0xFF5B0060),
                      Color(0xFF870160),
                      Color(0xFFAC255E),
                      Color(0xFFCA485C),
                      Color(0xFFE16B5C),
                      Color(0xFFF39060),
                      Color(0xFFFFB56B),
                    ],
                  ),
                  onPressed: () => {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
