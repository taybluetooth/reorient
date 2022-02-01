import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reorient/pages/login.dart';
import 'package:reorient/themes/Gradients.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
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
              const Padding(
                padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 8.0),
                child: SizedBox(
                  width: 220,
                  child: Text(
                    "Chosen just for you.",
                    style: ReorientTextStyles.headerText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                width: 220,
                child: Text(
                  "Discover new hobbies. Properly",
                  style: ReorientTextStyles.subHeaderText,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: GradientButton(
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: ReorientColors.white,
                    ),
                  ),
                  width: 200,
                  gradient: ReorientGradients.mainGradient,
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()))
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
