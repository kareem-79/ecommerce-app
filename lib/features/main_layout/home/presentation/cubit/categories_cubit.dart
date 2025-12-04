import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_categories_ise_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category_entity.dart';
@lazySingleton
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.getCategoriesUseCase})
      : super(CategoriesInitial());
  GetCategoriesUseCase getCategoriesUseCase;

  void getCategories() async {
    emit(CategoriesLoading());
    final result = await getCategoriesUseCase.call();
    result.fold((failure) => emit(CategoriesError(failure.message)),
        (categories) => emit(CategoriesSuccess(categories)));
  }
}

class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  List<CategoryEntity> categories;

  CategoriesSuccess(this.categories);
}

class CategoriesError extends CategoriesState {
  String message;

  CategoriesError(this.message);
}
