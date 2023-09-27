import 'package:trilhaapp/model/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<List<Tarefa>> listarTarefas() async {
    await Future.delayed(Duration(milliseconds: 0));
    return _tarefas;
  }

  Future<void> adicionarTarefa(Tarefa tarefa) async {
    await Future.delayed(Duration(milliseconds: 0));
    _tarefas.add(tarefa);
  }

  Future<void> alterarTarefa(String id, bool concluido) async {
    await Future.delayed(Duration(milliseconds: 0));
    _tarefas.where((tarefa) => tarefa.id == id).first.concluido;
  }

  Future<void> removerTarefa(String id) async {
    await Future.delayed(Duration(milliseconds: 0));
    _tarefas.remove(_tarefas.where((tarefa) => tarefa.id == id).first);
  }

  Future<List<Tarefa>> listarTarefasNaoConcluidas() async {
    await Future.delayed(Duration(milliseconds: 0));
    return _tarefas.where((tarefa) => !tarefa.concluido).toList();
  }
}
