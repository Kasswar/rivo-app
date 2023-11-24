import 'dart:async';


import 'package:bloc/bloc.dart';


import 'package:rivo_app/core/functions/global_function.dart';


import 'package:rivo_app/features/auth/data/repository_implement/auth_repository_implement.dart';


import 'package:rivo_app/features/auth/domain/usecases/register_usecase.dart';


part 'register_event.dart';


part 'register_state.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  final _registerUsecase =

      RegisterUsecase(authRepository: AuthRepositoryImplement());


  RegisterBloc() : super(RegisterState()) {

    on<GetRegisterEvent>(_mapRegisterState);

    on<GetDateEvent>(_mapDateState);

  }


  FutureOr<void> _mapDateState(

      GetDateEvent event, Emitter<RegisterState> emit) {

    emit(state.copyWith(dateTime: event.dateTime));

  }


  FutureOr<void> _mapRegisterState(

      GetRegisterEvent event, Emitter<RegisterState> emit) async {

    emit(state.copyWith(registerStatus: RegisterStatus.loading));


    final result = await _registerUsecase(event.registerParams);


    result.fold(

        (l) => emit(state.copyWith(registerStatus: RegisterStatus.failed)),

        (authModel) {

      emit(state.copyWith(registerStatus: RegisterStatus.success));


      GlobalFunctions.setToken(authModel.data!.user!.accessToken!);


      GlobalFunctions.setUserId(authModel.data!.user!.id!);

    });

  }

}

