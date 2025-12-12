import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/product_repositories.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepositories)
class ProductRepositoriesImpl implements ProductRepositories {
  ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoriesImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
      [String? categoryId]) async {
    try {
      final response = await productRemoteDataSource.getProducts(categoryId);
      return Right(response.product
          .map((product) => product.toProductEntity())
          .toList());
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
