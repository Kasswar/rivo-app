import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rivo_app/core/functions/global_function.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<CheckAuthEvent>(_mapSplashState);
  }

  FutureOr<void> _mapSplashState(
      CheckAuthEvent event, Emitter<SplashState> emit) async {
    final isAuth = await GlobalFunctions.isAuth();
    if (isAuth) {
      emit(state.copyWith(authStatus: SplashAuthStatus.auth));
    } else {
      emit(state.copyWith(authStatus: SplashAuthStatus.unauth));
    }
  }
}
