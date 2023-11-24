part of 'register_bloc.dart';


sealed class RegisterEvent {

  const RegisterEvent();

}


class GetRegisterEvent extends RegisterEvent {

  final RegisterParams registerParams;


  const GetRegisterEvent({required this.registerParams});

}


class GetDateEvent extends RegisterEvent {

  final String dateTime;


  GetDateEvent({required this.dateTime});

}
