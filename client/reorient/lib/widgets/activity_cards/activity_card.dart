import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';

class ActivityCard extends StatelessWidget {
  final String name;

  const ActivityCard({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        color: ReorientColors.yellow,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/$name.svg',
              width: 100,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              (name).split("_").join(" "),
              style: ReorientTextStyles.buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
