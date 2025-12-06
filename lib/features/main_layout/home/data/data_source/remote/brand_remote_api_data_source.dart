import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_source/remote/brand_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/model/brands_response/BrandsResponse.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/errors/app_exception.dart';
import '../../../../../../core/resources/constants_manager.dart';

@LazySingleton(as: BrandRemoteDataSource)
class BrandRemoteApiDataSource implements BrandRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  @override
  Future<BrandsResponse> getBrands() async {
    try {
      final response = await dio.get(ApiConstant.brandsEndpoint);
      return BrandsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Something went wrong');
    }
  }
}
