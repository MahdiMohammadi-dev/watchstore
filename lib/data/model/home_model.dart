import 'package:watchstore/data/model/banner_model.dart';
import 'package:watchstore/data/model/category_model.dart';
import 'package:watchstore/data/model/product_model.dart';
import 'package:watchstore/data/model/slider_model.dart';

class HomeModel {
  final List<SliderModel> sliders;
  final List<CategoryModel> categories;
  final List<ProductModel> amazingProduct;
  final List<ProductModel> mostSellerProduct;
  final List<ProductModel> newestProduct;
  final BannerModel banner;

  HomeModel(
      {required this.sliders,
      required this.categories,
      required this.amazingProduct,
      required this.mostSellerProduct,
      required this.newestProduct,
      required this.banner});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
      sliders: (json['sliders'] as List<dynamic>)
          .map((e) => SliderModel.fromJson(e))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
      amazingProduct: (json['amazing_products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      mostSellerProduct: (json['amazing_products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      newestProduct: (json['newest_products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      banner: BannerModel.fromJson(json['banner']));
}
