import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:watchstore/data/api_links.dart';
import 'package:watchstore/data/model/product_model.dart';
import 'package:watchstore/utils/response_validator.dart';

abstract class IProductDataSource {
  Future<List<ProductModel>>? getAllByCategory(int id);
  Future<List<ProductModel>>? getAllByBrand(int id);
  Future<List<ProductModel>>? getSorted(String routeParameters);
  Future<List<ProductModel>>? searchProduct(String search);
}

class RemoteProductDataSource implements IProductDataSource {
  final Dio httpClient;

  RemoteProductDataSource({required this.httpClient});

  //* Get All Product By Brand
  @override
  Future<List<ProductModel>>? getAllByBrand(int id) async {
    List<ProductModel> productList = [];
    var response = await httpClient
        .get(ApisLink.baseUrl + ApisLink.productByBrand + id.toString());

    HttpResponseValidator.isValidateStatusCode(response.statusCode!);
    for (var element in response.data['all_products']['data'] as List) {
      productList.add(ProductModel.fromJson(element));
    }
    return productList;
  }

  //! Get All Product By Category
  @override
  Future<List<ProductModel>>? getAllByCategory(int id) async {
    List<ProductModel> productList = [];
    var response = await httpClient
        .get(ApisLink.baseUrl + ApisLink.productByCategory + id.toString());

    HttpResponseValidator.isValidateStatusCode(response.statusCode!);
    for (var element in response.data['all_products']['data'] as List) {
      productList.add(ProductModel.fromJson(element));
    }
    return productList;
  }

  //* Get All Product with Sorted
  @override
  Future<List<ProductModel>>? getSorted(String routeParameters) async {
    List<ProductModel> productList = [];
    var response = await httpClient
        .get(ApisLink.baseUrl + ApisLink.versionRoute + routeParameters);

    HttpResponseValidator.isValidateStatusCode(response.statusCode!);
    debugPrint(response.data.toString());
    for (var element in response.data['all_products']['data'] as List) {
      productList.add(ProductModel.fromJson(element));
    }
    return productList;
  }

  //* search Product Method
  @override
  Future<List<ProductModel>>? searchProduct(String search) async {
    List<ProductModel> productList = [];
    var response = await httpClient
        .get(ApisLink.baseUrl + ApisLink.baseUrl + ApisLink.search + search);

    HttpResponseValidator.isValidateStatusCode(response.statusCode!);
    for (var element in response.data['all_products']['data'] as List) {
      productList.add(ProductModel.fromJson(element));
    }
    return productList;
  }
}
