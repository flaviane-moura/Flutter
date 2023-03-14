// ignore_for_file: unused_import, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables


import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseInsercaoPage extends StatefulWidget {

  @override
  _FirebaseInsercaoPage createState() => _FirebaseInsercaoPage();
}

class _FirebaseInsercaoPage extends State<FirebaseInsercaoPage> {

  var name;
  var age;

  final _formKey = GlobalKey<FormState>();

  final dbRef = FirebaseDatabase.instance.ref();

  adicionar(){

    _formKey.currentState?.save();
    
    dbRef.child('users').push().set({
      'name': name,
      'age': age
    });
    print('Dados inseridos com sucesso!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Firebase Inserção')
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
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
              onPressed: adicionar, 
              child: Text('Adicionar')
            )
          ],
        )
      )
    );
  }
}

