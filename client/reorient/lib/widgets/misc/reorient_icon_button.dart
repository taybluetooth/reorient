import 'package:flutter/material.dart';
import 'package:reorient/themes/colors.dart';

class ReorientIconButton extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final Icon icon;
  final void Function()? onPressed;

  const ReorientIconButton({
    Key? key,
    required this.color,
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
        color: color,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
          disabledColor: ReorientColors.darkGrey,
        ),
      ),
    );
  }
}
