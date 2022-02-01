import 'package:flutter/material.dart';

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

final emailField = TextField(
  obscureText: false,
  style: style,
  decoration: InputDecoration(
    label: Text("Email"),
    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    hintText: "johndoe@gmail.com",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
  ),
);
final passwordField = TextField(
  obscureText: true,
  style: style,
  decoration: InputDecoration(
    label: Text("Password"),
    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    hintText: "●●●●●●●●●●",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
  ),
);

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 45.0),
          emailField,
          SizedBox(height: 25.0),
          passwordField,
          SizedBox(
            height: 35.0,
          ),
        ],
      ),
    );
  }
}
