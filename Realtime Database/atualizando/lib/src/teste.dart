// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void enviaPost(String titulo, String corpo) async {
  final response = await http.post(
     Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    body: {
      'title': titulo,
      'body': corpo,
      'userId': '7'
    }
  );

  if(response.statusCode == 201){ //requisição deu certo
    print(response.body);
  } else {
    throw Exception('Falhou na requisição!');
  }

}

class TestePage extends StatefulWidget {
  @override
  _TestePage createState() => _TestePage();
}

class _TestePage extends State<TestePage>{

  String titulo = '';
  String corpo = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Teste')
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Digite o titulo'),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Digite um título';
                  }
                  return null;
                },
                onSaved: (t) {
                  setState(() {
                    titulo = t!;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Digite o corpo'),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Digite um corpo';
                  }
                  return null;
                },
                onSaved: (t) {
                  setState(() {
                    corpo = t!;
                  });
                }
              ),
              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();

                    enviaPost(titulo, corpo);
                  }
                },
                child: Text('Enviar')
              )
            ],
          )
        ),
      )
    );
  }
}