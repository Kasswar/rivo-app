part of 'register_bloc.dart';


enum RegisterStatus { initial, loading, failed, success }


class RegisterState {

  final RegisterStatus registerStatus;


  final String dateTime;


  RegisterState({

    this.registerStatus = RegisterStatus.initial,

    this.dateTime = "",

  });


  RegisterState copyWith({RegisterStatus? registerStatus, String? dateTime}) {

    return RegisterState(

      registerStatus: registerStatus ?? this.registerStatus,

      dateTime: dateTime ?? this.dateTime,

    );

  }

}

