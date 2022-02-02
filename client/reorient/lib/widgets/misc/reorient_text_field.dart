import 'package:flutter/material.dart';
import 'package:reorient/themes/colors.dart';

class ReorientTextField extends StatelessWidget {
  final String hint;
  final String label;
  final String? Function(String?)? validator;
  final bool obscureText;

  const ReorientTextField({
    Key? key,
    this.hint = "",
    this.label = "",
    required this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: const TextStyle(fontFamily: 'Roboto', fontSize: 20.0),
      validator: validator,
      enableSuggestions: false,
      autocorrect: false,
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
