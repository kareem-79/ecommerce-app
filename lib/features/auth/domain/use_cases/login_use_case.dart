import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/LoginRequest.dart';
import '../entities/user_entity.dart';
@singleton
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});
  Future<Either<Failure, UserEntity>> call(LoginRequest request) {
    return authRepository.login(request);
  }
}
