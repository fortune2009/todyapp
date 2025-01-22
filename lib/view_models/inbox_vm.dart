import 'package:todyapp/models/create_todo_model.dart';
import 'package:todyapp/models/get_todo_model.dart';
import 'package:todyapp/services/api_service.dart';

import '../utils/all_packages.dart';

class InboxViewModel extends ChangeNotifier {
  ApiService apiService = ApiService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Item>? todoItem;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> fetchTodos({bool load = true}) async {
    _isLoading = load;
    notifyListeners();

    try {
      Map<String, String>? query = {"page": "1", "limit": "10"};
      final TodoResponse res = await apiService.fetchTodos("todos", query);
      todoItem = res.items;
    } catch (error) {
      debugPrint("Error fetching todos: $error");
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addTodos() async {
    _isLoading = true;
    notifyListeners();

    try {
      final CreateTodoResponse res = await apiService.addTodos("todos", {
        "title": titleController.text,
        "description": descriptionController.text,
        "is_completed": false
      });
      debugPrint("Add todos: ${res.data!.toJson()}");
    } catch (error) {
      debugPrint("Error creating todos: $error");
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> editTodos(
      {String? id,
      String? title,
      String? description,
      bool isCompleted = false}) async {
    // _isLoading = true;
    notifyListeners();

    try {
      final CreateTodoResponse res = await apiService.editTodos("todos/$id", {
        "title": title,
        "description": description,
        "is_completed": isCompleted
      });
      debugPrint("Edit todos: ${res.data!.toJson()}");
    } catch (error) {
      debugPrint("Error creating todos: $error");
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteTodos({
    String? id,
    String? title,
    String? description,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final CreateTodoResponse res = await apiService.deleteTodos("todos/$id");
      debugPrint("Delete todos: ${res.data!.toJson()}");
    } catch (error) {
      debugPrint("Error creating todos: $error");
    }

    _isLoading = false;
    notifyListeners();
  }
}
