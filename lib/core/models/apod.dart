class Apod {
  final String title;
  final String explanation;
  final String url;
  final String mediaType;
  final String date;

  Apod({
    required this.title,
    required this.explanation,
    required this.url,
    required this.mediaType,
    required this.date,
  });

  factory Apod.fromJson(Map<String, dynamic> json) {
    return Apod(
      title: json['title'] as String,
      explanation: json['explanation'] as String,
      url: json['url'] as String,
      mediaType: json['media_type'] as String,
      date: json['date'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'explanation': explanation,
      'url': url,
      'media_type': mediaType,
      'date': date,
    };
  }
}
