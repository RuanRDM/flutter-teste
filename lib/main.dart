import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text("Estudar Flutter"),
              subtitle: Text("Verificar catalogo de widgets"),
              leading: Icon(Icons.add_alert),
            ),
          )
        ],
      ),
    )
  ));
}

