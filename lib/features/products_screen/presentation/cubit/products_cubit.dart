import 'package:ecommerce_app/features/products_screen/domain/use_case/product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/product_entity.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productUseCase}) : super(ProductsInitial());
  ProductUseCase productUseCase;

  void getProducts([String? categoryId]) async {
    emit(ProductsLoading());
    final result = await productUseCase.call(categoryId);
    result.fold((failure) => emit(ProductsError(failure.message)),
        (products) => emit(ProductsSuccess(products)));
  }
}

class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  List<ProductEntity> products;

  ProductsSuccess(this.products);
}

class ProductsError extends ProductsState {
  String message;

  ProductsError(this.message);
}
