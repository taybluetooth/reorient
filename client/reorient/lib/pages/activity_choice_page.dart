import 'package:flutter/material.dart';
import 'package:reorient/controllers/activity_controller.dart';
import 'package:reorient/models/Activity.dart';
import 'package:reorient/widgets/appbar/reorient_appbar.dart';

class ActivityChoicePage extends StatefulWidget {
  const ActivityChoicePage({Key? key}) : super(key: key);

  @override
  State<ActivityChoicePage> createState() => _ActivityChoicePageState();
}

class _ActivityChoicePageState extends State<ActivityChoicePage> {
  List<Activity> activities = [];

  _ActivityChoicePageState() {
    fetchRecommendation(activity: "IceHockey", rating: 5).then(
      (val) => setState(
        () {
          activities = val;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ReorientAppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: activities
                .map(
                  (e) => Text(
                    "${e.activity}: ${e.rating}",
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
