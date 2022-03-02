import 'dart:convert';

import 'package:reorient/helpers/string_manipulation.dart';
import 'package:reorient/models/activity.dart';
import 'package:http/http.dart' as http;

class ActivityController {
  static Future<List<Activity>> _fetch({required Activity activity}) async {
    final response = await http.get(Uri.parse(
        'http://10.0.2.2:5000/api/v1/recommend?activity=${capitalize(activity.activity)}&rating=${activity.rating}'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final List<dynamic> json = jsonDecode(response.body);
      List<Activity> output = [];

      for (var i = 0; i < json.length; i++) {
        output.add(Activity.fromJson(json[i]));
      }

      return output;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load recommendation');
    }
  }

  static Future<List<List<Activity>>> getRecommendation(
      {required List<Activity> activities}) async {
    List<List<Activity>> output = [];

    for (var element in activities) {
      _fetch(activity: element).then((value) => output.add(value));
      print(output);
    }

    return output;
  }
}
