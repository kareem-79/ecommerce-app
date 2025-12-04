import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';

import '../../../../../core/errors/failure.dart';

abstract class BrandsRepositories {
  Future<Either<Failure, List<BrandEntity>>> getBrands();
}
