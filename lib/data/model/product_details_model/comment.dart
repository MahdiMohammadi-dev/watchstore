class Comment {
  String? user;
  String? body;

  Comment({this.user, this.body});

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        user: json['user'] as String?,
        body: json['body'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user,
        'body': body,
      };
}
