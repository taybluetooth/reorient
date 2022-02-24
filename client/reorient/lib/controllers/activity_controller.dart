import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reorient/models/activity.dart';

Future<List<Activity>> fetchRecommendation(
    {activity = "Football", rating = 0}) async {
  final response = await http.get(Uri.parse(
      'http://10.0.2.2:5000/api/v1/recommend?activity=$activity&rating=$rating'));

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
    throw Exception('Failed to load album');
  }
}
