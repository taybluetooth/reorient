import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ReorientColors.black,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          SvgPicture.asset('assets/golf.svg'),
          Text(
            'Golf',
            style: ReorientTextStyles.buttonText,
          ),
        ],
      ),
    );
  }
}
