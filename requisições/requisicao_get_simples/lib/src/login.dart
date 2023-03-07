// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPage createState() => _LoginPage();

}

class _LoginPage extends State<LoginPage>{

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Login')
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Digite seu e-mail"
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Digite um e-mail!";
                  }
                  return null;
                },
                onSaved: (txt){
                  setState(() {
                    email = txt!;
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Digite sua senha"
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Digite uma senha!";
                  }
                  if(value.length < 4){
                    return "Senha muito curta. (Pelo menos 4 caracteres)";
                  }
                  return null;
                },
                onSaved: (txt){
                  setState(() {
                    senha = txt!;
                  });
                }
              ),
              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                  }
                },
                child: Text('Entrar')
              ), 

              Text('E-mail: $email'),
              Text('Senha: $senha')
            ],
          )
        ),
      )
    );
  }
}