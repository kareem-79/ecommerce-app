import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/product_repositories.dart';
import 'package:injectable/injectable.dart';

import '../entity/product_entity.dart';

@lazySingleton
class ProductUseCase {
  ProductRepositories productRepositories;

  ProductUseCase({required this.productRepositories});

  Future<Either<Failure, List<ProductEntity>>> call([String? categoryId]) {
    return productRepositories.getProducts(categoryId);
  }
}
