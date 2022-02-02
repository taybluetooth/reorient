import 'package:flutter/material.dart';

class GradientIconButton extends StatelessWidget {
  final Gradient gradient;
  final double width;
  final double height;
  final Icon icon;
  final void Function()? onPressed;

  const GradientIconButton({
    Key? key,
    required this.gradient,
    this.width = 50.0,
    this.height = 50.0,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: IconButton(onPressed: onPressed, icon: icon),
          ),
        ),
      ),
    );
  }
}
