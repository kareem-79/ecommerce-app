import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(InitState());
  AuthRepository authRepository;

  void register(RegisterRequest request) async {
    emit(RegisterLoading());
    var result = await authRepository.register(request);
    result.fold((failure) {
      emit(RegisterError(massage: failure.message));
    }, (user) {
      emit(RegisterSuccess());
    });
  }

  void login(LoginRequest request) async {
    emit(LoginLoading());
    var result = await authRepository.login(request);
    result.fold((failure) {
      emit(LoginError(massage: failure.message));
    }, (user) {
      emit(LoginSuccess());
    });
  }
}

abstract class AuthState {}

class InitState extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterError extends AuthState {
  String massage;

  RegisterError({required this.massage});
}

class RegisterSuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginError extends AuthState {
  String massage;

  LoginError({required this.massage});
}

class LoginSuccess extends AuthState {}
