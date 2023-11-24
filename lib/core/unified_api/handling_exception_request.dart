import 'dart:convert';

import 'package:http/http.dart';
import 'package:rivo_app/core/errors/server_exception.dart';
import 'package:rivo_app/core/errors/unauthenticated_exception.dart';

mixin HandlingExceptionRequest {
  Exception getException({required Response response}) {
    final String message = json.decode(response.body)['message'];
    if (response.statusCode == 401) {
      return UnauthenticatedExeption();
    }
    return ServerException(message);
  }
}
