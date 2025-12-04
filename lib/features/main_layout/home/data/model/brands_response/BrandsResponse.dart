import '../../../../../../core/models/Metadata.dart';
import 'brand.dart';

class BrandsResponse {
  BrandsResponse({
    required this.results,
    required this.metadata,
    required this.brands,
  });

  factory BrandsResponse.fromJson(dynamic json) {
    return BrandsResponse(
        results: json['results'],
        metadata: Metadata.fromJson(json['metadata']),
        brands: (json['data'] as List<dynamic>)
            .map((brand) => Brand.fromJson(brand))
            .toList());
  }

  final int results;
  final Metadata metadata;
  final List<Brand> brands;
}
