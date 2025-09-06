import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/src/data/models/message_model.dart';
import 'package:flutter_task/src/presentation/bloc/chat/chat_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<MessageModel> _messages = [];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      final messageText = _messageController.text.trim();

      setState(() {
        _messages.add(MessageModel(message: messageText, isUser: true));
      });

      context.read<ChatBloc>().add(
        SendMessage(MessageModel(message: messageText)),
      );
    }

    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Home Screen")),
      body: BlocListener<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is ChatError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if (state is ChatSuccess) {
            setState(() {
              _messages.add(
                MessageModel(message: state.response.message, isUser: false),
              );
            });
          }
        },
        child: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? const Center()
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final messageModel = _messages[index];
                        return Align(
                          alignment: messageModel.isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75,
                            ),
                            decoration: BoxDecoration(
                              color: messageModel.isUser
                                  ? Colors.blue.shade500
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Text(
                              messageModel.message,
                              style: TextStyle(
                                fontSize: 16,
                                color: messageModel.isUser
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Mesaj yaz..',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FloatingActionButton(
                    mini: true,
                    onPressed: _sendMessage,
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
