part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

final class SendMessage extends ChatEvent {
  const SendMessage(this.request);
  final MessageModel request;
}
