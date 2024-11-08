import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio); // dependacy injection for cleaner code

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get("$_baseUrl$endpoint"); // the get requist returns a response with varios information including the data
    return response.data;
  }
}
