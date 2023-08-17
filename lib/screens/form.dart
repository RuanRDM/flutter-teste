import 'package:flutter/material.dart';
import '../components/editor.dart';
import '../models/tarefa.dart';

class FormTarefa extends StatefulWidget {
  final TextEditingController controladorTarefa = TextEditingController();
  final TextEditingController controladorObs = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormTarefaState();
  }
}

class FormTarefaState extends State<FormTarefa>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form de Tarefas"),
        ),
        body: SingleChildScrollView(
         child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Editor(widget.controladorTarefa,
                    "Tarefa",
                    "Informe a tarefa",
                    Icons.assignment),
                Editor(widget.controladorObs,
                    "Obs",
                    "Informe a descrição",
                    Icons.assignment),
                ElevatedButton(onPressed: (){
                  criarTarefa(context);
                }, child: Text("Salvar"))
              ],
            )
          )
        )
    );
  }
  void criarTarefa(BuildContext context){
    final tarefa = Tarefa(widget.controladorTarefa.text, widget.controladorObs.text);
    Navigator.pop(context, tarefa);
    SnackBar snackBar = SnackBar(content: Text("Tarefa criada com sucesso!"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}