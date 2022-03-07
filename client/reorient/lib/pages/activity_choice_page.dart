import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorient/helpers/activity_list.dart';
import 'package:reorient/models/activity_card_helper.dart';
import 'package:reorient/pages/account_page.dart';
import 'package:reorient/pages/main_page.dart';
import 'package:reorient/pages/rating_page.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/widgets/activity_cards/activity_card.dart';
import 'package:reorient/widgets/appbar/reorient_appbar.dart';
import 'package:reorient/widgets/misc/reorient_icon_button.dart';

class ActivityChoicePage extends StatefulWidget {
  const ActivityChoicePage({Key? key}) : super(key: key);

  @override
  State<ActivityChoicePage> createState() => _ActivityChoicePageState();
}

class _ActivityChoicePageState extends State<ActivityChoicePage> {
  List<String> selectedActivities = [];
  List<ActivityCardHelper> activityCardList = activitiesList
      .map((e) => ActivityCardHelper(e, ReorientColors.yellow))
      .toList();
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ReorientAppBar(),
      backgroundColor: ReorientColors.white,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: IconButton(
          onPressed: () => {Get.to(() => const MainPage())},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
              const SizedBox(height: 24.0),
              Text(
                'Okay, Please choose up to 5 activities.',
                style: ReorientTextStyles.subHeaderText,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: activityCardList
                      .map(
                        (e) => GestureDetector(
                          onTap: () => _onTap(e),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ActivityCard(
                              name: e.name,
                              color: e.color,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const Center(
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 32.0,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ReorientIconButton(
                        color: selectedActivities.isNotEmpty
                            ? ReorientColors.lightGreen
                            : ReorientColors.lightGrey,
                        onPressed: (selectedActivities.isNotEmpty
                            ? () => Get.to(() =>
                                RatingPage(activities: selectedActivities))
                            : null),
                        icon: const Icon(Icons.check))),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(e) {
    if (selectedActivities.length < 5) {
      if (selectedActivities.contains(e.name)) {
        selectedActivities.remove(e.name);
        e.color = ReorientColors.yellow;
        setState(() {});
      } else {
        selectedActivities.add(e.name);
        e.color = ReorientColors.lightGreen;
        setState(() {});
      }
    } else {
      if (e.color == ReorientColors.lightGreen) {
        e.color = ReorientColors.yellow;
        setState(() {});
        selectedActivities.remove(e.name);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You can only choose 5 activities.'),
            duration: Duration(seconds: 1),
            backgroundColor: ReorientColors.red,
          ),
        );
      }
    }
  }
}
