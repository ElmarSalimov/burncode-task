import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/src/data/models/login_request_model.dart';
import 'package:flutter_task/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_task/src/presentation/bloc/auth/auth_event.dart';
import 'package:flutter_task/src/presentation/bloc/auth/auth_state.dart';
import 'package:flutter_task/src/presentation/screens/register_screen.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login Screen'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(state.errorMessage),
                ),
              );
            }
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(state.successMessage),
                ),
              );

              context.go('/home');
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        LoginEvent(
                          LoginRequestModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  GestureDetector(
                    onTap: () {
                      context.pushReplacement('/register');
                    },
                    child: Text("Don't have an account? Register"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
