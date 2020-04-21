import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'tarefa.dart';

void main() {
  runApp(new TodoListApp());
}

class TodoListApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "TodoList App",
      home: new ListaScreen() 
    );
  }
}

class ListaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {

  List<Tarefa> tarefas = new List<Tarefa>();
  TextEditingController controller = new TextEditingController();

  void adicionaTarefa(String nome){
    setState(() {
      tarefas.add(Tarefa(nome));
    });

    controller.clear();
  }

  Widget getItem(Tarefa tarefa) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
       IconButton(
          icon: new Icon(
            tarefa.concluida == true 
            ? Icons.check_box 
            : Icons.check_box_outline_blank, 
            size: 42.0, color: Colors.green,
          ),
          padding: EdgeInsets.only(left: 10.0, right: 30.0),
          onPressed: () {
            setState(() {
              if (tarefa.concluida == false){
                tarefa.concluida = true;
              }else{
                tarefa.concluida = false;
              }
            });
          }
        ),
        new Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(tarefa.nome, 
              style: 
                TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(tarefa.data.toIso8601String()),//Intl -> biblioteca de formatações
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lista de tarefas")
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                adicionaTarefa(value);
              },
            )
          ),
          Expanded( 
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (_, indice) {
                return getItem(tarefas[indice]);
              },
            )
          )
          
        ]
      )
    );
  }

}