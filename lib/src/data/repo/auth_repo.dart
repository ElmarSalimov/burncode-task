import 'package:dio/dio.dart';
import 'package:flutter_task/src/data/contract/auth_contract.dart';
import 'package:flutter_task/src/data/models/login_request_model.dart';
import 'package:flutter_task/src/data/models/login_response_model.dart';
import 'package:flutter_task/src/data/models/register_request_model.dart';
import 'package:flutter_task/src/data/services/auth_service.dart';

final class AuthRepo implements AuthContract {
  AuthRepo(this.authService);
  final AuthService authService;

  @override
  Future<Response> register(RegisterRequestModel request) {
    return authService.register(request);
  }

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) {
    return authService.login(request);
  }
}
