import 'dart:developer';

import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(InitState());
  AuthRepository authRepository;

  void register(RegisterRequest request) async {
    try {
      emit(RegisterLoading());
      var response = await authRepository.register(request);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError(massage: e.toString()));
      log("$e");
    }
  }

  void login(LoginRequest request)async {
    try {
      emit(LoginLoading());
      var response = await authRepository.login(request);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(massage: e.toString()));
      log("$e");
    }
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
