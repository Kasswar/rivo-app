import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:rivo_app/core/functions/global_function.dart';
import 'package:rivo_app/core/unified_api/handling_exception_request.dart';
import 'package:http/http.dart' as http;

typedef FromJson<T> = T Function(String body);

class GetApi<T> with HandlingExceptionRequest {
  final Uri uri;
  final Map? body;
  final FromJson fromJson;

  GetApi({required this.uri, this.body = const {}, required this.fromJson});

  Future<T> callRequest() async {
    String? token = await GlobalFunctions.getToken();
    bool isAuth = await GlobalFunctions.isAuth();
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        if (isAuth) "Authorization": "bearer $token"
      };
      var request = http.Request("GET", uri);
      request.body = jsonEncode(body);
      request.headers.addAll(headers);

      http.StreamedResponse streamedResponse =
          await request.send().timeout(const Duration(seconds: 20));
      http.Response response = await http.Response.fromStream(streamedResponse);
      print('*****************response.body******************');
      print(response.body);
      print('*****************response.statusCode******************');
      print(response.statusCode);
      if (response.statusCode == 200) {
        return fromJson(response.body);
      } else {
        Exception exception = getException(response: response);
        throw exception;
      }
    } on HttpException {
      log(
        'http exception',
        name: 'RequestManager get function',
      );
      rethrow;
    } on FormatException {
      log(
        'Format exception',
        name: 'RequestManager get function',
      );
      rethrow;
    } on SocketException {
      log(
        'socket exception',
        name: 'RequestManager get function',
      );
      rethrow;
    } catch (e) {
      log(
        e.toString(),
        name: 'RequestManager get function',
      );
      rethrow;
    }
  }
}
