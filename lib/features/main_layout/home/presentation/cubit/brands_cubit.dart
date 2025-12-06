import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_brands_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/brand_entity.dart';

@lazySingleton
class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit({required this.getBrandsUseCase}) : super(BrandsInitial());
  GetBrandsUseCase getBrandsUseCase;

  void getBrands() async {
    emit(BrandsLoading());
    final result = await getBrandsUseCase.call();
    result.fold((failure) => emit(BrandsError(failure.message)),
        (categories) => emit(BrandsSuccess(categories)));
  }
}

class BrandsState {}

class BrandsInitial extends BrandsState {}

class BrandsLoading extends BrandsState {}

class BrandsSuccess extends BrandsState {
  List<BrandEntity> brands;

  BrandsSuccess(this.brands);
}

class BrandsError extends BrandsState {
  String message;

  BrandsError(this.message);
}
