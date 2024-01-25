import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:8080/api";

  static Future<bool> login(String email, String password) async {
    try {
      var res = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (res.statusCode == 200) {
        print("Response Status: ${res.statusCode}");
        print("Response Body: ${res.body}");
        return true;
      }
      return false;
    } catch (error) {
      print("Error: $error");
      return false;
    }
  }
}
