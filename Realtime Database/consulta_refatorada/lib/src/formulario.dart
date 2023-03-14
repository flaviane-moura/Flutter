// ignore_for_file: library_private_types_in_public_api, unused_field, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  
  @override
  _Formulario createState() => _Formulario();

}

class _Formulario extends State<Formulario>{
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Digite seu nome',
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'Você precisa digitar algum nome.';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: (){
              if(_formkey.currentState!.validate()){
                print('Formulário VALIDADO');
              }
            },
            child: Text('Enviar')
          )
        ],
      ),
      
    );
  }
}