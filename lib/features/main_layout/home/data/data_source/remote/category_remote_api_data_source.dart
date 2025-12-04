import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_source/remote/category_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../model/categories_response/Categories_response.dart';

@LazySingleton(as: CategoryRemoteDataSource)
class CategoryRemoteApiDataSource implements CategoryRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  @override
  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await dio.get(ApiConstant.categoriesEndpoint);
      return CategoriesResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Something went wrong');
    }
  }
}
