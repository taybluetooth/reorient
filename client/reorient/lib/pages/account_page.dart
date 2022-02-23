import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reorient/pages/onboard_page.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/themes/gradients.dart';
import 'package:reorient/widgets/appbar/reorient_appbar.dart';
import 'package:reorient/widgets/gradient_widgets/gradient_button.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ReorientAppBar(),
      body: Center(
        child: Container(
            child: GradientButton(
          width: 150.0,
          child: Text(
            'Sign out',
            style: ReorientTextStyles.buttonText,
          ),
          gradient: ReorientGradients.mainGradient,
          onPressed: () => {
            _signOut(),
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OnboardPage(),
              ),
            ),
          },
        )),
      ),
    );
  }
}
