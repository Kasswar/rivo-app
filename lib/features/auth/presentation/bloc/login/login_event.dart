part of 'login_bloc.dart';

sealed class LoginEvent {
  const LoginEvent();
}

class GetLoginEvent extends LoginEvent {
  final LoginParams loginParams;

  GetLoginEvent({required this.loginParams});
}
