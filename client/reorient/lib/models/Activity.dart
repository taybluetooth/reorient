class Activity {
  final String activity;
  String rating;

  Activity({
    required this.activity,
    required this.rating,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json['activity'],
      rating: json['rating'],
    );
  }
}
