import 'package:rivo_app/core/config/typedef.dart';
import 'package:rivo_app/core/usecase/usecase.dart';
import 'package:rivo_app/features/auth/data/models/auth_model.dart';
import 'package:rivo_app/features/auth/domain/repository/auth_repository.dart';

class RegisterUsecase implements Usecase<AuthModel, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUsecase({required this.authRepository});
  @override
  DataResponse<AuthModel> call(RegisterParams params) {
    return authRepository.register(params.getBody());
  }
}

class RegisterParams with Params {
  final String userName;
  final String password;
  final String passwordConfirmation;
  final String fullName;
  final String dateOfBirth;
  final String gender;
  final String cityId;
  final String phone;

  RegisterParams(
      {required this.userName,
      required this.password,
      required this.passwordConfirmation,
      required this.fullName,
      required this.dateOfBirth,
      required this.gender,
      required this.cityId,
      required this.phone});

  @override
  BodyMap getBody() {
    return {
      "username": userName,
      "password": password,
      "password_confirmation": passwordConfirmation,
      'fullname': fullName,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'city_id': cityId,
      'phone': phone,
    };
  }
}
