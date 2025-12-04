import '../../../../../../core/models/Metadata.dart';
import 'category.dart';

class CategoriesResponse {
  const CategoriesResponse({
    required this.results,
    required this.metadata,
    required this.categories,
  });

  factory CategoriesResponse.fromJson(dynamic json) {
    return CategoriesResponse(
        results: json['results'],
        metadata: Metadata.fromJson(json['metadata']),
        categories: (json['data'] as List<dynamic>)
            .map((category) => Category.fromJson(category))
            .toList());
  }

  final int results;
  final Metadata metadata;
  final List<Category> categories;
}
