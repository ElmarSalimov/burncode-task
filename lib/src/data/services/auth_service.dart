import 'package:dio/dio.dart';
import 'package:flutter_task/core/api/api_endpoints.dart';
import 'package:flutter_task/src/data/models/login_request_model.dart';
import 'package:flutter_task/src/data/models/login_response_model.dart';
import 'package:flutter_task/src/data/models/register_request_model.dart';

class AuthService {
  AuthService(this._dio);

  final Dio _dio;

  Future<Response> register(RegisterRequestModel request) async {
    return await _dio.post(ApiEndpoints.register, data: request.toJson());
  }

  Future<LoginResponseModel> login(LoginRequestModel request) async {
    var response = await _dio.post(ApiEndpoints.login, data: request.toJson());

    print(response);

    return LoginResponseModel.fromJson(response.data);
  }
}
