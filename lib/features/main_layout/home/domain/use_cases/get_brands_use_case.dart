import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/brands_repositories.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
@lazySingleton
class GetBrandsUseCase {
  BrandsRepositories brandsRepositories;

  GetBrandsUseCase({required this.brandsRepositories});

  Future<Either<Failure, List<BrandEntity>>> call() {
    return brandsRepositories.getBrands();
  }
}
