import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reorient/helpers/email_validate.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/gradients.dart';
import 'package:reorient/widgets/gradient_widgets/gradient_border.dart';
import 'package:reorient/widgets/gradient_widgets/gradient_icon_button.dart';
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 45.0),
                  GradientBorder(
                    child: ReorientTextField(
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
                  ),
                  const SizedBox(height: 25.0),
                  GradientBorder(
                    child: ReorientTextField(
                      label: "Password",
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please a valid password';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GradientIconButton(
                gradient: ReorientGradients.mainGradient,
                onPressed: () => {
                  if (_formKey.currentState!.validate())
                    {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      )
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