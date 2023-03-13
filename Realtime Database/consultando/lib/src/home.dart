// ignore_for_file: prefer_const_constructors, unnecessary_this, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, avoid_print, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, sort_child_properties_last, library_private_types_in_public_api, unused_import, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/contador.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:  Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Center(
                child: Text('Bem vindo ao app',style: TextStyle(fontSize: 30))
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              }, 
              child: Text('Fazer Login')
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/teste');
              }, 
              child: Text('Ir para Teste')
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/firebase_consulta');
              }, 
              child: Text('Firebase Consulta')
            )
          ],
        ),
      )
    );
  }

}
