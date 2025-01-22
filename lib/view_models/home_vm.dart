import 'package:todyapp/models/create_todo_model.dart';
import 'package:todyapp/models/get_todo_model.dart';
import 'package:todyapp/services/api_service.dart';

import '../utils/all_packages.dart';

class HomeViewModel extends ChangeNotifier {
  ApiService apiService = ApiService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Item>? todoItem;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
}
