import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';
import 'package:ecommerce_app/features/auth/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authApiRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl(
      {required this.authApiRemoteDataSource,
      required this.authLocalDataSource});

  @override
  Future<Either<Failure, User>> register(RegisterRequest request) async {
    try {
      final response = await authApiRemoteDataSource.register(request);
      await authLocalDataSource.saveToken(response.token);
      return Right(response.user);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, User>> login(LoginRequest request)async {
    try {
      final response = await authApiRemoteDataSource.login(request);
      await authLocalDataSource.saveToken(response.token);
      return Right(response.user);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
