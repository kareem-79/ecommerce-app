import 'package:ecommerce_app/core/models/Metadata.dart';
import 'package:ecommerce_app/features/products_screen/data/models/products_response/Product.dart';

class ProductsResponse {
  ProductsResponse({
    required this.results,
    required this.metadata,
    required this.product,
  });

  factory ProductsResponse.fromJson(dynamic json) {
    return ProductsResponse(
        results: json['results'],
        metadata: Metadata.fromJson(json['metadata']),
        product: (json['data'] as List<dynamic>)
            .map((json) => Product.fromJson(json))
            .toList());
  }

  final num results;
  final Metadata metadata;
  final List<Product> product;
}
