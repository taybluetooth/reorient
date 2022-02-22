class Activity {
  final String activity;
  final String rating;

  const Activity({
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
