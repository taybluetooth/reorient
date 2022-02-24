import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorient/pages/login_page.dart';
import 'package:reorient/themes/Gradients.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/widgets/misc/reorient_button.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReorientColors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                width: 240,
                height: 180,
                image: AssetImage("assets/logo.PNG"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 8.0),
                child: SizedBox(
                  width: 250,
                  child: Text(
                    "Chosen just for you.",
                    style: ReorientTextStyles.headerText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 220,
                child: Text(
                  "Discover new hobbies. Properly.",
                  style: ReorientTextStyles.subHeaderText,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: ReorientButton(
                  child: Text(
                    "Login",
                    style: ReorientTextStyles.buttonText,
                  ),
                  width: 200,
                  color: ReorientColors.yellow,
                  onPressed: () => {
                    Get.to(
                      () => const LoginPage(),
                    ),
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
