import 'package:flutter/material.dart';

class ReorientButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double width;
  final double height;
  final void Function()? onPressed;

  const ReorientButton({
    Key? key,
    required this.child,
    required this.color,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Center(
          child: child,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
