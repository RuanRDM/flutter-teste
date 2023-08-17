import 'package:flutter/material.dart';
import '../components/editor.dart';
import '../models/tarefa.dart';

class FormTarefa extends StatelessWidget {
  final TextEditingController controladorTarefa = TextEditingController();
  final TextEditingController controladorObs = TextEditingController();

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
                Editor(controladorTarefa,
                    "Tarefa",
                    "Informe a tarefa",
                    Icons.assignment),
                Editor(controladorObs,
                    "Obs",
                    "Informe a descrição",
                    Icons.assignment),
                ElevatedButton(onPressed: (){
                  criarTarefa(context);
                }, child: Text("Salvar"))
              ],
            )
        )
    );
  }
  void criarTarefa(BuildContext context){
    final tarefa = Tarefa(controladorTarefa.text, controladorObs.text);
    Navigator.pop(context, tarefa);
    SnackBar snackBar = SnackBar(content: Text("Tarefa criada com sucesso!"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}