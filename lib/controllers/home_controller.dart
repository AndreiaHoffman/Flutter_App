import 'package:flutter/cupertino.dart';
import 'package:meu_primeiro_app/Model/todo_model.dart';
import 'package:meu_primeiro_app/services/dio_client.dart';
import 'package:meu_primeiro_app/services/json_placeholder_service.dart';

class HomeController extends ChangeNotifier {
  final JsonPlaceholderService _service;

  HomeController(this._service);

  var tarefas = <TodoModel>[];

  Future<void> fetchAllTarefas() async {
    tarefas = await _service.recuperarTodos();
    notifyListeners();
  }
}
