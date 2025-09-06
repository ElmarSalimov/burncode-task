import 'package:dio/dio.dart';
import 'package:flutter_task/core/api/api_endpoints.dart';
import 'package:flutter_task/core/di/di_config.dart';
import 'package:flutter_task/core/storage/storage_keys.dart';
import 'package:flutter_task/src/data/models/message_model.dart';

class ChatService {
  ChatService(this._dio, this._storage);

  final Dio _dio;
  final SecureStorage _storage;

  Future<MessageModel> sendMessage(MessageModel request) async {
    var accessToken = await _storage.read(StorageKeys.accessToken);

    var response = await _dio.post(
      ApiEndpoints.chatSend,
      data: request.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      ),
    );

    return MessageModel.fromJson(response.data);
  }
}
