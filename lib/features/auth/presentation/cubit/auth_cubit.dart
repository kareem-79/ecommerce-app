import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.registerUseCase,required this.loginUseCase}) : super(InitState());
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;
  void register(RegisterRequest request) async {
    emit(RegisterLoading());
    var result = await registerUseCase.call(request);
    result.fold((failure) {
      emit(RegisterError(massage: failure.message));
    }, (user) {
      emit(RegisterSuccess());
    });
  }

  void login(LoginRequest request) async {
    emit(LoginLoading());
    var result = await loginUseCase.call(request);
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
