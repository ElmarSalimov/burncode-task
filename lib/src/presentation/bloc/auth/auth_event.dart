import 'package:equatable/equatable.dart';
import 'package:flutter_task/src/data/models/login_request_model.dart';
import 'package:flutter_task/src/data/models/register_request_model.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoginEvent extends AuthEvent {
  LoginEvent(this.request);

  final LoginRequestModel request;
}

final class RegisterEvent extends AuthEvent {
  RegisterEvent(this.request);

  final RegisterRequestModel request;
}
