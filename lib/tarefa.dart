import 'dart:developer';
import 'package:intl/intl.dart';

class Tarefa
{  
  String nome;
  DateTime data;
  bool concluida;
  String data2;

  //Construtor
  Tarefa(String nome) {
    this.concluida = false;
    this.nome = nome;
    this.data = DateTime.now();
    // this.data2 = DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br').format(data);
    // print(data2);
    //DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br').format(tarefa.data)
  }

}