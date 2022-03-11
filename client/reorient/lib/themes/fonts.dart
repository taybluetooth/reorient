import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reorient/themes/colors.dart';

abstract class ReorientTextStyles {
  static TextStyle headerText = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ReorientColors.black,
  );
  static TextStyle subHeaderText = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: ReorientColors.darkGrey,
  );
  static TextStyle buttonText = GoogleFonts.montserrat(
      color: ReorientColors.black, fontSize: 14, fontWeight: FontWeight.bold);
  static TextStyle bodyText =
      GoogleFonts.montserrat(color: ReorientColors.black, fontSize: 16);
  static TextStyle h4 = GoogleFonts.montserrat(
      color: ReorientColors.black, fontSize: 16, fontWeight: FontWeight.bold);
}
