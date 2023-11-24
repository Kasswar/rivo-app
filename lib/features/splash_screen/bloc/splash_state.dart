// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_bloc.dart';

enum SplashAuthStatus { init, auth, unauth }

class SplashState {
  final SplashAuthStatus authStatus;

  SplashState({this.authStatus = SplashAuthStatus.init});

  SplashState copyWith({
    SplashAuthStatus? authStatus,
  }) {
    return SplashState(
      authStatus: authStatus ?? this.authStatus,
    );
  }
}
