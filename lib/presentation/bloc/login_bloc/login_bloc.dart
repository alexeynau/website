import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());

      try {
        // Perform the login logic here
        // You can use services or APIs to authenticate the user

        // Simulating a delay for demonstration purposes
        await Future.delayed(Duration(seconds: 2));

        // If login is successful, yield LoginSuccess
        emit(LoginSuccess());
      } catch (error) {
        // If login fails, yield LoginFailure with the error message
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}

