// ignore_for_file: unused_import, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables


import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ScreenArguments {
  final String? name;
  final String? age;
  final String? key;

  ScreenArguments(this.name, this.age, this.key);
}

class FirebaseAtualizaPage extends StatefulWidget {

  @override
  _FirebaseAtualizaPage createState() => _FirebaseAtualizaPage();
}

class _FirebaseAtualizaPage extends State<FirebaseAtualizaPage> {

  var name;
  var age;

  final _formKey = GlobalKey<FormState>();

  final dbRef = FirebaseDatabase.instance.ref();

  atualizar(key){

    _formKey.currentState?.save();
    
    dbRef.child('users').child(key).update({
      'name': name,
      'age': age

    });

    print('Dados atualizados com sucesso!');
  }

  @override
  Widget build(BuildContext context) {

    ScreenArguments args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar:  AppBar(
        title: Text('Firebase Atualização')
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: args.name,
              decoration: InputDecoration(
                labelText: 'Digite seu nome'
              ),
              onSaved: (t){
                setState(() {
                  name = t;
                });
              },
            ),
            TextFormField(
              initialValue: args.age,
              decoration: InputDecoration(
                labelText: 'Digite sua idade'
              ),
              onSaved: (t){
                setState(() {
                  age = t;
                });
              },
            ),
            ElevatedButton(
              onPressed: (){
                atualizar(args.key);
              }, 
              child: Text('Atualizar')
            )
          ],
        )
      )
    );
  }
}

