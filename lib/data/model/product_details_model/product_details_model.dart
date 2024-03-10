import 'color.dart';
import 'comment.dart';
import 'property.dart';

class ProductDetailsModel {
  int? id;
  String? title;
  String? titleEn;
  int? price;
  int? discount;
  int? discountPrice;
  String? guaranty;
  int? productCount;
  String? category;
  int? categoryId;
  List<Color>? colors;
  String? brand;
  int? brandId;
  int? review;
  String? image;
  List<Property>? properties;
  String? description;
  String? discussion;
  List<Comment>? comments;

  ProductDetailsModel({
    this.id,
    this.title,
    this.titleEn,
    this.price,
    this.discount,
    this.discountPrice,
    this.guaranty,
    this.productCount,
    this.category,
    this.categoryId,
    this.colors,
    this.brand,
    this.brandId,
    this.review,
    this.image,
    this.properties,
    this.description,
    this.discussion,
    this.comments,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      titleEn: json['title_en'] as String?,
      price: json['price'] as int?,
      discount: json['discount'] as int?,
      discountPrice: json['discount_price'] as int?,
      guaranty: json['guaranty'] as String?,
      productCount: json['product_count'] as int?,
      category: json['category'] as String?,
      categoryId: json['category_id'] as int?,
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => Color.fromJson(e as Map<String, dynamic>))
          .toList(),
      brand: json['brand'] as String?,
      brandId: json['brand_id'] as int?,
      review: json['review'] as int?,
      image: json['image'] as String?,
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      discussion: json['discussion'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'title_en': titleEn,
        'price': price,
        'discount': discount,
        'discount_price': discountPrice,
        'guaranty': guaranty,
        'product_count': productCount,
        'category': category,
        'category_id': categoryId,
        'colors': colors?.map((e) => e.toJson()).toList(),
        'brand': brand,
        'brand_id': brandId,
        'review': review,
        'image': image,
        'properties': properties?.map((e) => e.toJson()).toList(),
        'description': description,
        'discussion': discussion,
        'comments': comments?.map((e) => e.toJson()).toList(),
      };
}
