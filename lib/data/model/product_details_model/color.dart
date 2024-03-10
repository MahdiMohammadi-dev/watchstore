class Color {
  String? title;
  String? code;

  Color({this.title, this.code});

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        title: json['title'] as String?,
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'code': code,
      };
}
