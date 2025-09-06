import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/storage/secure_storage.dart';
import 'package:flutter_task/core/storage/storage_keys.dart';
import 'package:flutter_task/src/data/contract/auth_contract.dart';
import 'package:flutter_task/src/presentation/bloc/auth/auth_event.dart';
import 'package:flutter_task/src/presentation/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authContract, this._storage) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
  }

  final AuthContract _authContract;
  final SecureStorage _storage;

  Future<void> _onLogin(LoginEvent event, Emitter emit) async {
    try {
      emit(AuthLoading());

      var response = await _authContract.login(event.request);

      _storage.write(StorageKeys.accessToken, response.token);

      emit(AuthSuccess('Login success'));
    } on DioException catch (e) {
      emit(AuthError(e.response!.data['message']));
    } catch (e) {
      emit(AuthError('Error occured, try again'));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter emit) async {
    try {
      emit(AuthLoading());
      await _authContract.register(event.request);
      emit(AuthSuccess('Register success, log in to your account'));
    } on DioException catch (_) {
      emit(AuthError('Register Error'));
    } catch (e) {
      emit(AuthError('Error occured, try again'));
    }
  }
}
