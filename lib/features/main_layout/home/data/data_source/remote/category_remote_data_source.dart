import '../../model/categories_response/Categories_response.dart';

abstract class CategoryRemoteDataSource {
  Future<CategoriesResponse> getCategories();
}
