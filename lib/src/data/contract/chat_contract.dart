import 'package:flutter_task/src/data/models/message_model.dart';

abstract class ChatContract {
  Future<MessageModel> sendMessage(MessageModel request);
}
