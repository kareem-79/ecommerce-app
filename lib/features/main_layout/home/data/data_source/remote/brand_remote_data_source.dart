import 'package:ecommerce_app/features/main_layout/home/data/model/brands_response/BrandsResponse.dart';

abstract class BrandRemoteDataSource {
  Future<BrandsResponse> getBrands();
}
