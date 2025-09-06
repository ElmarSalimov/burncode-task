part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatError extends ChatState {
  const ChatError(this.errorMessage);
  final String errorMessage;
}

final class ChatSuccess extends ChatState {
  const ChatSuccess(this.response);
  final MessageModel response;
}
