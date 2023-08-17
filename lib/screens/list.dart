import 'package:flutter/material.dart';
import '../models/tarefa.dart';
import '../screens/form.dart';

class ItemTarefa extends StatelessWidget {
  Tarefa _tarefa;
  ItemTarefa(this._tarefa);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this._tarefa.descricao),
        subtitle: Text(this._tarefa.obs),
        leading: Icon(Icons.add_alert),
      ),
    );
  }
}

class ListaTarefa extends StatefulWidget {
  List<Tarefa> _tarefas = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTarefaState();
  }
}

class ListaTarefaState extends State<ListaTarefa> {
  @override
  Widget build(BuildContext context) {
    //widget._tarefas.add(Tarefa("preparar aula", 'postar'));
    //widget._tarefas.add(Tarefa("preparar aula 2", 'postar 2'));
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormTarefa();
          }));
          future.then((tarefa) {
            widget._tarefas.add(tarefa);
            setState(() {

            });
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: widget._tarefas.length,
        itemBuilder: (context, indice){
          final tarefa= widget._tarefas[indice];
          return ItemTarefa(tarefa);
        }),
    );
  }
}
