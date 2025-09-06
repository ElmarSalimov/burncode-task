import 'package:flutter_task/src/data/contract/chat_contract.dart';
import 'package:flutter_task/src/data/models/message_model.dart';
import 'package:flutter_task/src/data/services/chat_service.dart';

final class ChatRepo implements ChatContract {
  ChatRepo(this._service);
  final ChatService _service;

  @override
  Future<MessageModel> sendMessage(MessageModel request) {
    return _service.sendMessage(request);
  }
}
