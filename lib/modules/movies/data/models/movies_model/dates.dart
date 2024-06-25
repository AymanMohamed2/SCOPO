class Dates {
  final String maximum;
  final String minimum;

  Dates({required this.maximum, required this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      maximum: json['maximum'] as String,
      minimum: json['minimum'] as String,
    );
  }
}