import 'dart:async';

import 'dart:ffi';


import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:rivo_app/core/functions/global_function.dart';

import 'package:rivo_app/features/auth/data/repository_implement/auth_repository_implement.dart';


import 'package:rivo_app/features/auth/domain/usecases/login_usecase.dart';


part 'login_event.dart';

part 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final _loginUsecase = LoginUsecase(authRepository: AuthRepositoryImplement());

  LoginBloc() : super(LoginState()) {

    on<GetLoginEvent>(_mapLoginState);

  }

  FutureOr<void> _mapLoginState(

      GetLoginEvent event, Emitter<LoginState> emit) async {

    emit(state.copyWith(loginStatus: LoginStatus.loading));

    final result = await _loginUsecase(event.loginParams);

    result.fold((l) => emit(state.copyWith(loginStatus: LoginStatus.failed)),

        (authModel) {

      emit(state.copyWith(loginStatus: LoginStatus.success));

      GlobalFunctions.setToken(authModel.data!.user!.accessToken!);

      GlobalFunctions.setUserId(authModel.data!.user!.id!);

    });

  }

}

