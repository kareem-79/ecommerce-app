import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/product_entity.dart';

abstract class ProductRepositories {
  Future<Either<Failure, List<ProductEntity>>> getProducts(
      [String? categoryId]);
}
