import 'package:flutter/material.dart';

class Contador with ChangeNotifier{
  int valor = 0;
  String nome = '';

  void aumentar(){
    valor++;
    notifyListeners();
  }

  void mudarNome(novoNome){
    nome = novoNome;
    notifyListeners();
  }

}