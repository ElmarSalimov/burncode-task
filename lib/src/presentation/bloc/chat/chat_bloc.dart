import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/helper/logger.dart';
import 'package:flutter_task/src/data/contract/chat_contract.dart';
import 'package:flutter_task/src/data/models/message_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(this._chatContract) : super(ChatInitial()) {
    on<SendMessage>(_onSendMessage);
  }

  final ChatContract _chatContract;

  Future<void> _onSendMessage(SendMessage event, Emitter emit) async {
    try {
      emit(ChatLoading());

      var response = await _chatContract.sendMessage(event.request);

      emit(ChatSuccess(MessageModel(message: response.message)));
    } on DioException catch (e) {
      logger.e(e);

      emit(ChatError('Chat Error'));
    } catch (e) {
      emit(ChatError('Error occured, try again'));
    }
  }
}
