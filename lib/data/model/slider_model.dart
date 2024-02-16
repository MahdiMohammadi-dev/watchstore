class SliderModel {
  final int id;
  final String title;
  final String image;

  SliderModel({required this.id, required this.title, required this.image});

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String);
}
