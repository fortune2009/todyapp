import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todyapp/models/create_todo_model.dart';
import 'package:todyapp/models/get_todo_model.dart';

import '../utils/all_packages.dart';

class ApiService {
  final String baseUrl;
  Map<String, String> headers = {
    "accept": 'application/json',
    "Content-Type": 'application/json; charset=UTF-8',
  };

  ApiService({this.baseUrl = "api.nstack.in"});

  Future<TodoResponse> fetchTodos(
      String? url, Map<String, String>? queryParameters) async {
    final Uri uri = Uri.https(baseUrl, "/v1/$url", queryParameters);

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return TodoResponse.fromJson(data);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<CreateTodoResponse> addTodos(
      String? url, Map<String, dynamic>? body) async {
    final Uri uri = Uri.https(baseUrl, "/v1/$url");
    final response =
        await http.post(uri, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      return CreateTodoResponse.fromJson(data);
    } else {
      throw Exception('Failed to create');
    }
  }

  Future<CreateTodoResponse> editTodos(
      String? url, Map<String, dynamic>? body) async {
    final Uri uri = Uri.https(baseUrl, "/v1/$url");
    final response =
        await http.put(uri, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CreateTodoResponse.fromJson(data);
    } else {
      throw Exception('Failed to edit');
    }
  }

  Future<CreateTodoResponse> deleteTodos(String? url) async {
    final Uri uri = Uri.https(baseUrl, "/v1/$url");
    final response = await http.delete(uri, headers: headers);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CreateTodoResponse.fromJson(data);
    } else {
      throw Exception('Failed to delete');
    }
  }
}
