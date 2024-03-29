import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorient/auth/fire_auth.dart';
import 'package:reorient/helpers/email_validate.dart';
import 'package:reorient/pages/main_page.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/widgets/misc/reorient_icon_button.dart';
import 'package:reorient/widgets/misc/reorient_text_field.dart';

// Define a custom Form widget.
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 45.0),
                ReorientTextField(
                  controller: _emailTextController,
                  label: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid email address';
                    } else if (EmailValidate.check(value) == false) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25.0),
                ReorientTextField(
                  controller: _passwordTextController,
                  label: "Password",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please a valid password';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ReorientIconButton(
                color: ReorientColors.black,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    User? user = await FireAuth.signInUsingEmailPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                      context: context,
                    );
                    if (user != null) {
                      Get.to(
                        () => const MainPage(
                          recentLogIn: true,
                        ),
                        transition: Transition
                            .leftToRight, // choose your page transition accordingly
                        duration: const Duration(milliseconds: 300),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Incorrect email or password'),
                        duration: Duration(seconds: 3),
                        backgroundColor: ReorientColors.red,
                      ));
                    }
                  }
                },
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  color: ReorientColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
