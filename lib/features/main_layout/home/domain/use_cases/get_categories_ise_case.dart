import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/categories_repositories.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/category_entity.dart';
@lazySingleton
class GetCategoriesUseCase {
  CategoriesRepositories categoriesRepositories;

  GetCategoriesUseCase({required this.categoriesRepositories});

  Future<Either<Failure, List<CategoryEntity>>> call() {
    return categoriesRepositories.getCategories();
  }
}
