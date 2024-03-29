part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthVerifyState extends AuthState {
  final String mobile;

  AuthVerifyState(this.mobile);
}

class AuthSuccessState extends AuthState {}

class AuthRegistered extends AuthState {}

class AuthUnRegistered extends AuthState {}

class AuthLoggedInState extends AuthState {}

class AuthLoggedOutState extends AuthState {}

class AuthErrorState extends AuthState {
  final AppException appException;

  AuthErrorState(this.appException);
}
