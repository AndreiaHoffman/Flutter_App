import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/controllers/home_controller.dart';
import 'package:meu_primeiro_app/services/dio_client.dart';
import 'package:meu_primeiro_app/services/json_placeholder_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(JsonPlaceholderService(DioClient()));

  @override
  void initState() {
    super.initState();
    controller.fetchAllTarefas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Tarefas'),
        ),
        body: AnimatedBuilder(
            animation: controller,
            builder: (context, widget) {
              return ListView.builder(
                  itemCount: controller.tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = controller.tarefas[index];
                    return ListTile(
                      title: Text(tarefa.Nome),
                    );
                  });
            }));
  }
}
