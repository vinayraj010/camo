import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String _baseUrl = "https://apimvs.24livehost.com/api/Delivery";

  dynamic _handleResponse(
      http.Response response, Future<http.Response> Function()? retry) async {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        final json = jsonDecode(response.body);
        if (json.containsKey('errors')) {
          final errors = json['errors'] as Map<String, dynamic>;
          final errorMessages = errors.entries
              .map((e) => "${e.key}: ${e.value.join(', ')}")
              .join('\n');
          throw "Validation errors: $errorMessages";
        } else {
          throw "${json["message"]}";
        }
      case 403:
        throw "${response.body}";
      case 404:
        throw "${jsonDecode(response.body)["message"]}";
      case 500:
      default:
        throw "Server Error: ${response.body}";
    }
  }

  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse("$_baseUrl$endpoint");
    try {
      final response = await http.get(url);
      return _handleResponse(response, () async => await http.get(url));
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse("$_baseUrl$endpoint");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      return _handleResponse(
        response,
        () async {
          final refreshedToken = '';
          //= await secureStorageService.getToken();
          return await http.post(
            url,
            body: jsonEncode(body),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $refreshedToken",
            },
          );
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String endpoint) async {
    final url = Uri.parse("$_baseUrl$endpoint");
    try {
      final response = await http.delete(url);
      return _handleResponse(response, () async => await http.delete(url));
    } catch (e) {
      rethrow;
    }
  }

}
