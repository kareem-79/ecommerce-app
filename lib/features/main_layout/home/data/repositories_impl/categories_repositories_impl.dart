import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_source/remote/category_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/categories_repositories.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: CategoriesRepositories)
class CategoriesRepositoriesImpl implements CategoriesRepositories {
  CategoryRemoteDataSource categoryRemoteDataSource;

  CategoriesRepositoriesImpl({required this.categoryRemoteDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await categoryRemoteDataSource.getCategories();
      return Right(response.categories
          .map((category) => category.toCategoryEntity())
          .toList());
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.toString()));
    }
  }
}
