import 'package:flutter/material.dart';
import 'package:reorient/themes/colors.dart';

class ReorientTextField extends StatelessWidget {
  final String hint;
  final String label;

  const ReorientTextField({Key? key, this.hint = "", this.label = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      style: const TextStyle(fontFamily: 'Roboto', fontSize: 20.0),
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(color: ReorientColors.black),
        ),
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusedBorder: InputBorder.none,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: hint,
        hintStyle: const TextStyle(color: ReorientColors.black),
      ),
    );
  }
}
