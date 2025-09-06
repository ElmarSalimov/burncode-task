import 'package:dio/dio.dart';
import 'package:flutter_task/src/data/models/login_request_model.dart';
import 'package:flutter_task/src/data/models/login_response_model.dart';
import 'package:flutter_task/src/data/models/register_request_model.dart';

abstract class AuthContract {
  Future<Response> register(RegisterRequestModel request);
  Future<LoginResponseModel> login(LoginRequestModel request);
}
