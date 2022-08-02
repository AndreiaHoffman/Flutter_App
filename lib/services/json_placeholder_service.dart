import 'package:dio/dio.dart';
import 'package:meu_primeiro_app/Model/todo_model.dart';
import 'package:meu_primeiro_app/services/http_client_interface.dart';

class JsonPlaceholderService {
  final url =
      "https://localhost:7098/api/mobile/recuperartodos"; // aqui passa a url da api que vamos consumir
  //o valor 10.0.2.2 subistitui a palavra localhost
  //para que o emulador entenda que é para acessar o pc não o celuluar

  //esse dio é um cliente http que é usado para consumir api
  //desse jeito ele é passado como parametro no construtor da classe
  final IHttpClientInterface client;

  JsonPlaceholderService(this.client);

  Future<List<TodoModel>> recuperarTodos() async {
    final body = await client.get(url);
    // final body =
    //     response.data as List; // to convertendo a resposta da api para lista

    final tarefas = (body as List)
        .map((map) => TodoModel.fromJson(map))
        .toList(); // o map pega cada item da lista e transforma no modelo que vc quiser

    return tarefas;
  }
}
