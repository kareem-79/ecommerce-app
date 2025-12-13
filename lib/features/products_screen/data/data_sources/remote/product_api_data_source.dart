import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/products_response/ProductsResponse.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/resources/constants_manager.dart';

@LazySingleton(as: ProductRemoteDataSource)
class ProductApiDataSource implements ProductRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  @override
  Future<ProductsResponse> getProducts([String? categoryId]) async {
    try {
      final response = await dio.get(ApiConstant.productsEndpoint,
          queryParameters:
              categoryId == null ? null : {'category': categoryId});
      return ProductsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }

      throw RemoteException(message: message??"Failed to get products");
    }
  }
}
