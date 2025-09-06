import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/app.dart';
import 'package:flutter_task/core/di/service_locator.dart';
import 'package:flutter_task/core/helper/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}
