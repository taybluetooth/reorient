import 'package:flutter/material.dart';
import 'package:reorient/themes/gradients.dart';
import 'package:reorient/widgets/misc/reorient_text_field.dart';

class GradientBorder extends StatelessWidget {
  final Widget? child;

  const GradientBorder({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kInnerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4.0),
    );
    final kGradientBoxDecoration = BoxDecoration(
      gradient: ReorientGradients.mainGradient,
      borderRadius: BorderRadius.circular(4.0),
    );
    return Container(
      decoration: kGradientBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: DecoratedBox(
          decoration: kInnerDecoration,
          child: child,
        ),
      ),
    );
  }
}
