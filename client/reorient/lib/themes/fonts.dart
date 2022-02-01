import 'package:flutter/material.dart';
import 'package:reorient/themes/colors.dart';

abstract class ReorientTextStyles {
  static const TextStyle headerText = TextStyle(
    fontSize: 24,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    color: ReorientColors.black,
  );
  static const TextStyle subHeaderText = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    color: ReorientColors.darkGrey,
  );
}
