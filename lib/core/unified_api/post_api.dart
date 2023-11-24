import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:rivo_app/core/functions/global_function.dart';
import 'package:rivo_app/core/unified_api/handling_exception_request.dart';
import 'package:http/http.dart' as http;

typedef FromJson<T> = T Function(String body);

class PostApi<T> with HandlingExceptionRequest {
  final Uri uri;
  final Map body;
  final FromJson fromJson;
  final bool isLogin;
  final Duration timeout;

  PostApi({
    required this.uri,
    required this.body,
    required this.fromJson,
    this.isLogin = false,
    this.timeout = const Duration(seconds: 20),
  });

  Future<T> callRequest() async {
    String? token = await GlobalFunctions.getToken();
    bool isAuth = await GlobalFunctions.isAuth();
    log('the token in the request header is $token',
        name: 'request manager ==> post function ');
    try {
      var header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        if (isAuth) 'Authorization': 'Bearer $token',
      };

      var request = http.Request('POST', uri);
      request.body = jsonEncode(body);
      request.headers.addAll(header);
      http.StreamedResponse streamedResponse =
          await request.send().timeout(timeout);
      log(request.body, name: 'request body');
      http.Response response = await http.Response.fromStream(streamedResponse);
      print('-*-*--*---*-*-*-*-*-*--*-*-*-*-*-*-*');
      print(response.statusCode);
      print('HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH');
      print(response.body);
      log(response.body, name: 'response body');
      log(response.statusCode.toString(), name: 'status code');
      if (response.statusCode == 200) {
        return fromJson(response.body);
      } else {
        Exception exception = getException(response: response);
        throw exception;
      }
    } on HttpException {
      log(
        'Http Exception',
        name: 'Requestmanager Post Function',
      );
      rethrow;
    } on FormatException {
      log(
        'something went wrong in parsing the uri',
        name: 'Requestmanager Post Function',
      );
      rethrow;
    } on SocketException {
      log(
        'Socket Exception',
        name: 'Requestmanager Post Function',
      );
      rethrow;
    } catch (e) {
      log(
        e.toString(),
        name: 'Requestmanager Post Function',
      );
      rethrow;
    }
  }
}
