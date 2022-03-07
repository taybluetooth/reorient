import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:reorient/helpers/string_manipulation.dart';
import 'package:reorient/models/activity.dart';
import 'package:reorient/pages/recommendation_page.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/widgets/appbar/reorient_appbar.dart';
import 'package:reorient/widgets/misc/reorient_icon_button.dart';

class RatingPage extends StatefulWidget {
  final List<String> activities;

  const RatingPage({Key? key, required this.activities}) : super(key: key);

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  List<Activity> recommendations = [];
  List<Activity> ratings = [];

  @override
  void initState() {
    super.initState();
    ratings = widget.activities
        .map((e) => Activity(activity: e, rating: '1'))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ReorientAppBar(),
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
          padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Step 2'.toUpperCase(),
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
              const SizedBox(height: 48.0),
              Text(
                'How much do you enjoy each activity?',
                style: ReorientTextStyles.subHeaderText,
              ),
              const SizedBox(height: 32.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ratings
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: ReorientColors.white,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Text(
                                  capitalize(e.activity).split("_").join(" "),
                                  style: ReorientTextStyles.h4,
                                ),
                                const Spacer(),
                                RatingBar.builder(
                                  glow: false,
                                  initialRating: double.parse(e.rating),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star_rounded,
                                    color: ReorientColors.yellow,
                                    size: 1.0,
                                  ),
                                  onRatingUpdate: (rating) {
                                    e.rating = rating.toString();
                                    print(e.activity + ": " + e.rating);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 48.0),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ReorientIconButton(
                    color: ReorientColors.lightGreen,
                    onPressed: () => Get.to(
                      () => RecommendationPage(
                        activities: ratings,
                      ),
                    ),
                    icon: const Icon(Icons.check),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
