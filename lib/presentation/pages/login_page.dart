import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc/login_bloc.dart';

// Define the login page
class LoginPage extends StatelessWidget {
  
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            // Navigate to the home page or any other page after successful login
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (state is LoginFailure) {
            // Show an error message to the user
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      loginBloc.add(
                        LoginButtonPressed(
                          username: usernameController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20.0),
                  if (state is LoginLoading)
                    CircularProgressIndicator(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}