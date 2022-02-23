import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reorient/themes/colors.dart';

class ReorientTextField extends StatelessWidget {
  final String hint;
  final String label;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextEditingController? controller;

  const ReorientTextField({
    Key? key,
    this.hint = "",
    this.label = "",
    required this.validator,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: GoogleFonts.montserrat(fontSize: 20),
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
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ReorientColors.yellow,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        hintText: hint,
        hintStyle: const TextStyle(color: ReorientColors.black),
      ),
    );
  }
}
