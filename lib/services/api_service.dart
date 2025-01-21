import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});
  Future<List<Product>> fetchTodos(
      String? url, Map<String, dynamic>? queryParameters) async {
    final Uri uri = Uri.https(baseUrl, "/v1/$url", queryParameters);
    final response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
