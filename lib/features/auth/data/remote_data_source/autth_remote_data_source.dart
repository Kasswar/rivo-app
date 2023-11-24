import 'package:rivo_app/core/config/typedef.dart';
import 'package:rivo_app/core/unified_api/api_variables.dart';
import 'package:rivo_app/core/unified_api/post_api.dart';
import 'package:rivo_app/features/auth/data/models/auth_model.dart';

class AuthRemoteDataSource {
  Future<AuthModel> register(BodyMap body) async {
    PostApi postApi = PostApi(
      uri: ApiVariables.register(),
      body: body,
      fromJson: authModelFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }

  Future<AuthModel> login(BodyMap body) async {
    PostApi postApi = PostApi(
      uri: ApiVariables.login(),
      body: body,
      fromJson: authModelFromJson,
    );
    var result = await postApi.callRequest();
    return result;
  }
}
