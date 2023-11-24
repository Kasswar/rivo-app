import 'package:rivo_app/core/config/typedef.dart';
import 'package:rivo_app/core/unified_api/handling_exception_manager.dart';
import 'package:rivo_app/features/auth/data/models/auth_model.dart';
import 'package:rivo_app/features/auth/data/remote_data_source/autth_remote_data_source.dart';
import 'package:rivo_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImplement
    with HandlingExceptionManager
    implements AuthRepository {
  final _authRemoteDataSource = AuthRemoteDataSource();
  @override
  DataResponse<AuthModel> register(BodyMap body) async {
    return await wrapHandling(tryCall: () async {
      final result = await _authRemoteDataSource.register(body);
      return result;
    });
  }

  @override
  DataResponse<AuthModel> login(BodyMap body) async {
    return await wrapHandling(tryCall: () async {
      final result = await _authRemoteDataSource.login(body);
      return result;
    });
  }
}
