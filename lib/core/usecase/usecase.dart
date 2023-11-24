import 'package:rivo_app/core/config/typedef.dart';

abstract class Usecase<Type, P extends Params> {
  DataResponse<Type> call(P params);
}

mixin Params {
  BodyMap getBody() => {};
  QueryParams getParams() => {};
}

class NoParams with Params {}
