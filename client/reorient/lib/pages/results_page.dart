import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorient/models/activity.dart';
import 'package:reorient/pages/activity_choice_page.dart';
import 'package:reorient/pages/rating_page.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/widgets/appbar/reorient_appbar.dart';
import 'package:reorient/widgets/results/result_card.dart';

class ResultsPage extends StatefulWidget {
  final List<List<Activity>> recommendations;
  List<Map<dynamic, dynamic>> parsed = [];

  ResultsPage({Key? key, required this.recommendations}) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ReorientAppBar(),
      backgroundColor: ReorientColors.white,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: IconButton(
          onPressed: () => Get.to(() => const ActivityChoicePage()),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.recommendations
                .map(
                  (e) => Column(
                    children: e
                        .map(
                          (i) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ResultCard(activity: i),
                          ),
                        )
                        .toList()
                        .sublist(0, 10), // limit to only top 10 activities
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
