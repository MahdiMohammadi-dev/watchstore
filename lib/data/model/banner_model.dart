class BannerModel {
  final int id;
  final String title;
  final String image;
  final DateTime created_at;
  final DateTime updated_at;

  BannerModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.created_at,
      required this.updated_at});

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      created_at: DateTime.parse(json['created_at']),
      updated_at: DateTime.parse(json['updated_at']));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['created_at'] = this.created_at.toIso8601String();
    data['updated_at'] = this.updated_at.toIso8601String();

    return data;
  }
}
