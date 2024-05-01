import 'package:http/http.dart' as http;
import 'package:recipe_finder/core/constants/keys.dart';
import 'package:recipe_finder/services/valid_response.dart';

class NetworkService {
  String baseUrl = 'https://www.themealdb.com/api/json/v1/';

  Map<String, String> header = {};

  Future<ValidResponse> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl + Keys.apiKey + url),
        headers: headers,
      );
      return ValidResponse(
          statusCode: response.statusCode, body: response.body);
    } catch (e) {
      return ValidResponse(statusCode: 500, message: 'error : $e');
    }
  }

  Future<ValidResponse> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    var response = await http.post(
      Uri.parse(baseUrl + Keys.apiKey + url),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      return ValidResponse(
        statusCode: response.statusCode,
        body: response.body,
      );
    } else {
      return ValidResponse(
        statusCode: response.statusCode,
        message: response.reasonPhrase,
      );
    }
  }

  Future<http.Response> delete({
    required String url,
    Map<String, String>? headers,
  }) async {
    return await http.delete(
      Uri.parse(baseUrl + Keys.apiKey + url),
      headers: headers,
    );
  }

  Future<http.Response> put({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    return await http.put(
      Uri.parse(baseUrl + Keys.apiKey + url),
      headers: headers,
      body: body,
    );
  }
}
