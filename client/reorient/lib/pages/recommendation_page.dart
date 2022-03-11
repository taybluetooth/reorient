import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorient/controllers/activity_controller.dart';
import 'package:reorient/models/activity.dart';
import 'package:reorient/pages/results_page.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/themes/fonts.dart';
import 'package:reorient/widgets/appbar/reorient_appbar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RecommendationPage extends StatefulWidget {
  final List<Activity> activities;

  const RecommendationPage({Key? key, required this.activities})
      : super(key: key);

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  late Future<List<List<Activity>>> recommendationsF;
  List<List<Activity>> recommendations = [];

  @override
  void initState() {
    super.initState();
    recommendationsF =
        ActivityController.getRecommendation(activities: widget.activities);
    recommendationsF.then((value) => recommendations = value);
  }

  _RecommendationPageState() {
    Timer _timer = Timer(const Duration(seconds: 1), () {
      Get.to(() => ResultsPage(recommendations: recommendations));
    });
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
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Step 3'.toUpperCase(),
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
              const SizedBox(
                height: 120.0,
              ),
              const SpinKitWave(
                color: ReorientColors.yellow,
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                'fetching recommendations...',
                style: ReorientTextStyles.subHeaderText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
