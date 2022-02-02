import 'package:flutter/material.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/widgets/login/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      backgroundColor: ReorientColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 120.0, 16.0, 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: SizedBox(
                  width: 75,
                  child: Text(
                    "Sign in",
                    style: ReorientTextStyles.headerText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Sign in and start personalising your activities.",
                    style: ReorientTextStyles.subHeaderText,
                  ),
                ),
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
