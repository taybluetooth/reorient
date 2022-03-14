import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reorient/helpers/activity_list.dart';
import 'package:reorient/helpers/description_list.dart';
import 'package:reorient/models/activity.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/widgets/misc/reorient_icon_button.dart';

class ResultCard extends StatelessWidget {
  final Activity activity;
  final int index;

  const ResultCard({Key? key, required this.activity, required this.index})
      : super(key: key);

  String getDescription() {
    String output = "";
    for (var i = 0; i < descriptionList.length; i++) {
      if (descriptionList[i][0] == activity.activity.split('_').join(" ")) {
        output = descriptionList[i][1];
      }
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ReorientColors.yellow,
          border: Border.all(
            color: ReorientColors.darkYellow,
            width: 1.4,
          ),
          borderRadius: BorderRadius.circular(4.0)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ExpansionTile(
          title: Row(
            children: [
              Container(
                width: 45.0,
                height: 45.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ReorientColors.white,
                ),
                child: Center(
                  child: Text(
                    index.toString(),
                    style: ReorientTextStyles.headerText,
                  ),
                ),
              ),
              const VerticalDivider(
                thickness: 1.5,
              ),
              const SizedBox(
                width: 8.0,
              ),
              SvgPicture.asset(
                "assets/" + activity.activity.toLowerCase() + ".svg",
                width: 50,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                activity.activity.split('_').join(" "),
                style: ReorientTextStyles.h4,
              ),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                getDescription(),
                style: ReorientTextStyles.bodyText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
