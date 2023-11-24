part of 'login_bloc.dart';

enum LoginStatus { initial, loading, failed, success }

class LoginState {
  final LoginStatus loginStatus;

  LoginState({this.loginStatus = LoginStatus.initial});

  LoginState copyWith({LoginStatus? loginStatus}) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}
