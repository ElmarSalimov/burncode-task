import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  AuthSuccess(this.successMessage);
  final String successMessage;
}

final class AuthError extends AuthState {
  AuthError(this.errorMessage);
  final String errorMessage;
}
