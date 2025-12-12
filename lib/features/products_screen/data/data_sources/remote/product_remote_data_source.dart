import 'package:ecommerce_app/features/products_screen/data/models/products_response/ProductsResponse.dart';

abstract class ProductRemoteDataSource {
  Future<ProductsResponse> getProducts([String? categoryId]);
}
