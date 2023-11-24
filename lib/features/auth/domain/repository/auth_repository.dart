import 'package:rivo_app/core/config/typedef.dart';
import 'package:rivo_app/features/auth/data/models/auth_model.dart';

abstract class AuthRepository {
  DataResponse<AuthModel> register(BodyMap body);
  DataResponse<AuthModel> login(BodyMap body);
}
