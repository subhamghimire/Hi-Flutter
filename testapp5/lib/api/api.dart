import 'dart:convert';

import 'package:testapp5/jwt/token.dart';
import 'package:http/http.dart' as http;
import '../common.dart';

class CallApi {
  static Future<ApiResponse> post(data, path) async {
    Uri fullUrl = Uri.http(apiUrl, '/api/' + path);
    print(fullUrl);
    var response = await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders(await Token.getToken()));

    print(json.decode(response.body));
    return sendResponse(response);
  }

  static Future<ApiResponse> get(path, [queryParams]) async {
    if (queryParams == null) queryParams = {};
    String fullUrl =
        'http://' + apiUrl + '/api/' + path + '?' + getQueryString(queryParams);
    print(fullUrl);
    var response =
        await http.get(fullUrl, headers: _setHeaders(await Token.getToken()));
    print(json.decode(response.body));
    return sendResponse(response);
  }

  static _setHeaders(token) {
    return {
      'Authorization': 'Bearer ' + token,
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static ApiResponse sendResponse(response) {
    ApiResponse apiResponse = new ApiResponse();
    if (response.statusCode == 200 &&
        json.decode(response.body)['success'] == true) {
      apiResponse.setSuccess(true);
      apiResponse.setData(json.decode(response.body));
      return apiResponse;
    }
    apiResponse.setErrors(json.decode(response.body)['errors']);
    return apiResponse;
  }
}

class ApiResponse {
  var _errors;
  bool _success;
  var _data;

  ApiResponse() {
    this._success = false;
    this._data = null;
    this._errors = null;
  }

  getErrors() {
    return this._errors;
  }

  setErrors(errors) {
    this._errors = errors != null ? Map.from(errors) : null;
  }

  setSuccess(bool success) {
    this._success = success;
  }

  setData(data) {
    this._data = data;
  }

  getData() {
    return this._data;
  }

  hasErrors() {
    return !this._success;
  }

  printData() {
    print(this._data);
  }

  printErrors() {
    print(this._errors);
  }
}

String getQueryString(Map params,
    {String prefix: '&', bool inRecursion: false}) {
  String query = '';

  params.forEach((key, value) {
    if (inRecursion) {
      key = '[$key]';
    }

    if (value is String || value is int || value is double || value is bool) {
      query += '$prefix$key=$value';
    } else if (value is List || value is Map) {
      if (value is List) value = value.asMap();
      value.forEach((k, v) {
        query +=
            getQueryString({k: v}, prefix: '$prefix$key', inRecursion: true);
      });
    }
  });

  return query;
}
