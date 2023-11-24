import 'dart:developer';

import 'package:rivo_app/core/config/typedef.dart';

class ApiVariables {
  static const String _scheme = 'https';
  static const String _host = 'api-cashlock.lve-co.com';

  static Uri _mainUri({
    required String path,
    QueryParams? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString());
    return uri;
  }

  static Uri _userUri({
    required String path,
    QueryParams? queryParameters,
  }) =>
      _mainUri(path: 'user/$path', queryParameters: queryParameters);
//-------------auth----------------------------
  static Uri _auth({
    required String path,
    QueryParams? queryParameters,
  }) =>
      _mainUri(path: 'user/auth/$path', queryParameters: queryParameters);

  static Uri register() => _auth(path: 'register');
  static Uri login() => _auth(path: 'login');
  //-------------subscribedRestaurant--------------
  static Uri subscribedRestaurant({QueryParams? params}) =>
      _userUri(path: "indexSubscribedResturants", queryParameters: params);
}
