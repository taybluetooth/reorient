import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorient/models/activity.dart';
import 'package:reorient/pages/activity_choice_page.dart';
import 'package:reorient/pages/rating_page.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/widgets/appbar/reorient_appbar.dart';

class ResultsPage extends StatefulWidget {
  List<List<Activity>> recommendations;

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
      body: Column(
        children: widget.recommendations
            .map((e) => Column(
                  children:
                      e.map((i) => Text("${i.activity}:${i.rating}")).toList(),
                ))
            .toList(),
      ),
    );
  }
}
