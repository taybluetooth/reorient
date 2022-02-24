import 'package:flutter/material.dart';
import 'package:reorient/helpers/activity_list.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ReorientAppBar(),
      backgroundColor: ReorientColors.white,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: IconButton(
          onPressed: () => {Navigator.pop(context)},
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
              const SizedBox(height: 32.0),
              Text(
                'Okay, Please choose up to 5 activities.',
                style: ReorientTextStyles.subHeaderText,
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: activitiesList
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ActivityCard(name: e),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
