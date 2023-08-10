import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ListaTarefa()));
}

class Tarefa {
  String descricao;
  String obs;
  Tarefa(this.descricao, this.obs);
}

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

class ListaTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          ItemTarefa(Tarefa("Tarefa 1", "desc da tarefa 1")),
          ItemTarefa(Tarefa("Tarefa 2", "desc da tarefa 2")),
          ItemTarefa(Tarefa("Tarefa 3", "desc da tarefa 3")),
        ],
      ),
    );
  }
}

class FormTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form de Tarefas"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  style: TextStyle(fontSize: 20.0),
                  decoration: InputDecoration(
                    icon: Icon(Icons.chat),
                    labelText: "Tarefa",
                    hintText: "Informe a tarefa",
                  ),
                ),
                TextField(
                  style: TextStyle(fontSize: 20.0),
                  decoration: InputDecoration(
                    icon: Icon(Icons.chat),
                    labelText: "Tarefa 2",
                    hintText: "Informe a tarefa 2",
                  ),
                ),
                ElevatedButton(onPressed: (){}, child: Text("Salvar"))
              ],
            )
        )
    );
  }
}
