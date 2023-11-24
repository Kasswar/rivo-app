import 'package:rivo_app/core/config/typedef.dart';
import 'package:rivo_app/core/usecase/usecase.dart';
import 'package:rivo_app/features/auth/data/models/auth_model.dart';
import 'package:rivo_app/features/auth/domain/repository/auth_repository.dart';

class LoginUsecase extends Usecase<AuthModel, LoginParams> {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});
  @override
  DataResponse<AuthModel> call(LoginParams params) {
    return authRepository.login(params.getBody());
  }
}

class LoginParams with Params {
  final String userName;
  final String password;

  LoginParams({required this.userName, required this.password});
  @override
  BodyMap getBody() {
    return {
      'username': userName,
      'password': password,
    };
  }
}
