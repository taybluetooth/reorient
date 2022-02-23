import 'package:flutter/material.dart';
import 'package:reorient/controllers/activity_controller.dart';
import 'package:reorient/models/Activity.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/widgets/activity_cards/activity_card.dart';
import 'package:reorient/widgets/appbar/reorient_appbar.dart';

class ActivityChoicePage extends StatefulWidget {
  const ActivityChoicePage({Key? key}) : super(key: key);

  @override
  State<ActivityChoicePage> createState() => _ActivityChoicePageState();
}

class _ActivityChoicePageState extends State<ActivityChoicePage> {
  List<Activity> activities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ReorientAppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(
                      'Step 1'.toUpperCase(),
                      style: ReorientTextStyles.buttonText,
                    ),
                    Text(
                      '/3'.toUpperCase(),
                      style: ReorientTextStyles.buttonText.copyWith(
                        fontWeight: FontWeight.w500,
                        color: ReorientColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
              ActivityCard(),
            ],
          ),
        ),
      ),
    );
  }
}
