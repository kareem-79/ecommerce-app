// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i1050;
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_sharedPrefs_local_data_source.dart'
    as _i120;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_api_data_source.dart'
    as _i607;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i255;
import 'package:ecommerce_app/features/auth/data/repositories_impl/auth_repository_impl.dart'
    as _i609;
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart'
    as _i804;
import 'package:ecommerce_app/features/auth/domain/use_cases/login_use_case.dart'
    as _i1044;
import 'package:ecommerce_app/features/auth/domain/use_cases/register_use_case.dart'
    as _i552;
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart'
    as _i118;
import 'package:ecommerce_app/features/main_layout/home/data/data_source/remote/category_remote_api_data_source.dart'
    as _i490;
import 'package:ecommerce_app/features/main_layout/home/data/data_source/remote/category_remote_data_source.dart'
    as _i841;
import 'package:ecommerce_app/features/main_layout/home/data/repositories_impl/categories_repositories_impl.dart'
    as _i314;
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/categories_repositories.dart'
    as _i1051;
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_categories_ise_case.dart'
    as _i640;
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/categories_cubit.dart'
    as _i851;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i255.AuthRemoteDataSource>(() => _i607.AuthApiDataSource());
    gh.singleton<_i1050.AuthLocalDataSource>(
        () => _i120.AuthSharedprefsLocalDataSource());
    gh.lazySingleton<_i841.CategoryRemoteDataSource>(
        () => _i490.CategoryRemoteApiDataSource());
    gh.lazySingleton<_i1051.CategoriesRepositories>(() =>
        _i314.CategoriesRepositoriesImpl(
            categoryRemoteDataSource: gh<_i841.CategoryRemoteDataSource>()));
    gh.singleton<_i804.AuthRepository>(() => _i609.AuthRepositoryImpl(
          authApiRemoteDataSource: gh<_i255.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i1050.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i640.GetCategoriesUseCase>(() =>
        _i640.GetCategoriesUseCase(
            categoriesRepositories: gh<_i1051.CategoriesRepositories>()));
    gh.singleton<_i1044.LoginUseCase>(
        () => _i1044.LoginUseCase(authRepository: gh<_i804.AuthRepository>()));
    gh.singleton<_i552.RegisterUseCase>(() =>
        _i552.RegisterUseCase(authRepository: gh<_i804.AuthRepository>()));
    gh.singleton<_i118.AuthCubit>(() => _i118.AuthCubit(
          registerUseCase: gh<_i552.RegisterUseCase>(),
          loginUseCase: gh<_i1044.LoginUseCase>(),
        ));
    gh.lazySingleton<_i851.CategoriesCubit>(() => _i851.CategoriesCubit(
        getCategoriesUseCase: gh<_i640.GetCategoriesUseCase>()));
    return this;
  }
}
