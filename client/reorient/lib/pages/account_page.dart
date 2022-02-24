import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reorient/pages/onboard_page.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/widgets/appbar/reorient_appbar.dart';
import 'package:reorient/widgets/misc/reorient_button.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ReorientAppBar(),
      body: Center(
        child: ReorientButton(
          width: 150.0,
          child: Text(
            'Sign out',
            style: ReorientTextStyles.buttonText,
          ),
          color: ReorientColors.yellow,
          onPressed: () => {
            _signOut(),
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OnboardPage(),
              ),
            ),
          },
        ),
      ),
    );
  }
}
