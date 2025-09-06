import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/di/service_locator.dart';
import 'package:flutter_task/src/presentation/bloc/chat/chat_bloc.dart';
import 'package:flutter_task/src/presentation/screens/home_screen.dart';
import 'package:flutter_task/src/presentation/screens/login_screen.dart';
import 'package:flutter_task/src/presentation/screens/register_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/register',
  routes: [
    GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(
      path: '/home',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ChatBloc>(),
        child: HomeScreen(),
      ),
    ),
  ],
);
