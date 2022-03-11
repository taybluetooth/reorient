import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorient/helpers/array_manipulation.dart';
import 'package:reorient/models/activity.dart';
import 'package:reorient/pages/activity_choice_page.dart';
import 'package:reorient/pages/main_page.dart';
import 'package:reorient/themes/colors.dart';
import 'package:reorient/widgets/appbar/reorient_appbar.dart';
import 'package:reorient/widgets/misc/reorient_icon_button.dart';
import 'package:reorient/widgets/results/result_card.dart';

class ResultsPage extends StatefulWidget {
  final List<List<Activity>> recommendations;
  List<Activity> parsed = [];

  ResultsPage({Key? key, required this.recommendations}) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.parsed = ArrayManipulation.twoDimToOneDim(widget.recommendations);
  }

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
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 16.0),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView(
                          children: widget.parsed
                              .map(
                                (i) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ResultCard(
                                    activity: i,
                                    index: (widget.parsed.indexOf(i)) + 1,
                                  ),
                                ),
                              )
                              .toList()
                              .sublist(
                                  0, 10), // limit to only top 10 activities
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ReorientIconButton(
                  color: ReorientColors.lightGreen,
                  onPressed: () => Get.to(() => const MainPage()),
                  icon: const Icon(Icons.check),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
