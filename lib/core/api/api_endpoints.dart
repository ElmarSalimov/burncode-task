class ApiEndpoints {
  static const String _baseAuth = 'https://flutter-task.burncode.org/api';

  static const String register = '$_baseAuth/auth/register';
  static const String login = '$_baseAuth/auth/login';

  static const String chatSend = '$_baseAuth/chatSend';
}
