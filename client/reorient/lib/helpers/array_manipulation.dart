import 'package:reorient/models/activity.dart';

abstract class ArrayManipulation {
  static List<Activity> twoDimToOneDim(List<List<Activity>> list) {
    return list.expand((i) => i).toSet().toList();
  }
}
