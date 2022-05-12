import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:project_19022022/data/storage/token_storage.dart';
import 'package:project_19022022/models/environment.dart';

class BaseService {
  // GET
  Future<dynamic> get(String api) async {
    var token = await TokenStorage().getToken().then((String? token) {
      return token;
    });
    var uri = Uri.parse(Environment.apiUrl + api);
    try {
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Authorization': token ?? '',
      }).timeout(
        const Duration(seconds: 30),
      );
      return _processResponse(response);
    } on SocketException {
      throw 'Lost internet connection.';
    } on TimeoutException {
      throw 'Api is not response.';
    } catch (exception) {
      throw exception.toString();
    }
  }

  // POST
  Future<dynamic> post(String api, [dynamic payloadObj]) async {
    var token = await TokenStorage().getToken().then((String? token) {
      return token;
    });
    var uri = Uri.parse(Environment.apiUrl + api);
    String body = json.encode(payloadObj ?? {});
    try {
      var response = await http
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': token ?? '',
            },
            body: body,
          )
          .timeout(
            const Duration(seconds: 30),
          );
      return _processResponse(response);
    } on SocketException {
      throw 'Lost internet connection.';
    } on TimeoutException {
      throw 'Api is not response.';
    } catch (exception) {
      throw exception.toString();
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        return responseJson;
      case 400:
        throw 'Bad request.';
      case 401:
      case 403:
        throw 'Unauthorized request.';
      case 500:
      default:
        throw 'Something went wrong.';
    }
  }
}
