import "dart:convert";

import "package:http/http.dart" as http;
import "package:donut_app_2b_luis_vera/models/product.dart";


class ProductService {
  static const String baseUrl = "http://localhost:8080/market-3b/api";

  static Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));
    if (response.statusCode == 200){
      final List<dynamic> jsonData = json.decode(response.body);
      //Devuelvo Lista de Productos
      return jsonData.map((item) => Product.fromJson(item)).toList();
    }else{
      throw Exception("Error al Cargar Productos por Categoria");
    }
  }

     static Future<List<Product>> getProductsByCategory(int categoryId) async {
    final response = await http.get(Uri.parse("$baseUrl/products/category/$categoryId"));
    if (response.statusCode == 200){
      final List<dynamic> jsonData = json.decode(response.body);
      //Devuelvo Lista de Productos
      return jsonData.map((item) => Product.fromJson(item)).toList();
    }else{
      throw Exception("Error al Cargar Productos por Categoria");
    }
  }

  }


