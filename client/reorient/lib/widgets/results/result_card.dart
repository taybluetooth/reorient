import 'package:flutter/material.dart';
import 'package:reorient/models/activity.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';

class ResultCard extends StatelessWidget {
  final Activity activity;

  const ResultCard({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: ReorientColors.yellow),
          borderRadius: BorderRadius.circular(4.0)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Text(
              activity.activity,
              style: ReorientTextStyles.h4,
            ),
          ],
        ),
      ),
    );
  }
}
