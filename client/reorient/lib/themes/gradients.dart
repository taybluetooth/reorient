import 'package:flutter/material.dart';

abstract class ReorientGradients {
  static const LinearGradient oldGradient = LinearGradient(
    colors: <Color>[
      Color(0xFF5B0060),
      Color(0xFF870160),
      Color(0xFFAC255E),
      Color(0xFFCA485C),
      Color(0xFFE16B5C),
      Color(0xFFF39060),
      Color(0xFFFFB56B),
    ],
  );
  static const LinearGradient mainGradient = LinearGradient(
    colors: <Color>[
      Color(0xFFFFE401),
      Color(0xFFFFE401),
    ],
  );
  static const LinearGradient blackGradient = LinearGradient(
    colors: <Color>[
      Color(0xFF000000),
      Color(0xFF000000),
    ],
  );
}
