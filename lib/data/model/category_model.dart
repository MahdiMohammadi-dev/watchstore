class CategoryModel {
  final int id;
  final String title;
  final String image;

  CategoryModel({required this.id, required this.title, required this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(id: json['id'], title: json['title'], image: json['image']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;

    return data;
  }
}
