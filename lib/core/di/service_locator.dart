import 'package:flutter_task/src/presentation/bloc/chat/chat_bloc.dart';

import 'di_config.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    return dio;
  });

  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());

  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt<Dio>()));
  getIt.registerLazySingleton<ChatService>(
    () => ChatService(getIt<Dio>(), getIt<SecureStorage>()),
  );

  getIt.registerLazySingleton<AuthContract>(
    () => AuthRepo(getIt<AuthService>()),
  );
  getIt.registerLazySingleton<ChatContract>(
    () => ChatRepo(getIt<ChatService>()),
  );

  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(getIt<AuthContract>(), getIt<SecureStorage>()),
  );
  getIt.registerFactory<ChatBloc>(() => ChatBloc(getIt<ChatContract>()));
}
