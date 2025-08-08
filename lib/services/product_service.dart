import "dart:convert";
import "package:http/http.dart" as http;
import "package:donut_app_2b_luis_vera/models/product.dart";
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  static const String baseUrl = "http://localhost:8090/market-app/api";

  static Future<Map<String, String>> _getHeadersWithToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null || token.isEmpty) {
      print("❌ No hay token");
      return {'Content-Type': 'application/json'};
    }

    print("🔐 Enviando token: $token");

    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  static Future<List<Product>> getAllProducts() async {
    final headers = await _getHeadersWithToken();
    final response = await http.get(
      Uri.parse("$baseUrl/products/all"),
      headers: headers,
    );

    print("📦 Respuesta productos: ${response.statusCode}");

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Error al cargar productos: ${response.statusCode}");
    }
  }

  static Future<List<Product>> getProductsByCategory(int categoryId) async {
    final headers = await _getHeadersWithToken();
    final response = await http.get(
      Uri.parse("$baseUrl/products/category/$categoryId"),
      headers: headers,
    );

    print("📦 Respuesta por categoría: ${response.statusCode}");

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Error al cargar productos por categoría: ${response.statusCode}");
    }
  }
}
