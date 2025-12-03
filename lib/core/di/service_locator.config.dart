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
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart'
    as _i118;
import 'package:ecommerce_app/features/auth/repositories/auth_repository.dart'
    as _i883;
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
    gh.singleton<_i883.AuthRepository>(() => _i609.AuthRepositoryImpl(
          authApiRemoteDataSource: gh<_i255.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i1050.AuthLocalDataSource>(),
        ));
    gh.singleton<_i118.AuthCubit>(
        () => _i118.AuthCubit(authRepository: gh<_i883.AuthRepository>()));
    return this;
  }
}
