class TodoModel {
  final int Id;
  final String Nome;
  final bool Completado;
  final String Prazo;

  TodoModel(
      {required this.Id,
      required this.Nome,
      required this.Completado,
      required this.Prazo});

  static TodoModel fromJson(Map map) {
    return TodoModel(
        Id: map['id'],
        Nome: map['nome'],
        Completado: map['completado'],
        Prazo: map['prazo']);
  }
}
