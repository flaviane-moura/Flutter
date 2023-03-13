// ignore_for_file: unused_import, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, avoid_print

//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseConsultaPage extends StatefulWidget {

  @override
  _FirebaseConsultaPage createState() => _FirebaseConsultaPage();
}

class _FirebaseConsultaPage extends State<FirebaseConsultaPage> {

  var users = [];

  final dbRef = FirebaseDatabase.instance.ref();

  consultar(){
    dbRef.child('users').once().then((DatabaseEvent databaseEvent){
      setState(() {
        if(databaseEvent.snapshot.value != null){
          var values = databaseEvent.snapshot.value as List<dynamic>;
          for(var i=0; i < values.length; i++){
            if(values[i] != null) {
              users.add(values[i]);        
            }
          }
          print(users);
        }
      });
    });
  }

  @override
  void initState(){
    super.initState();
    consultar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Firebase Consulta')
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Expanded(
            child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index){
              var name = users[index]['name'];
              var age = users[index]['age'].toString();
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(name),
                subtitle: Text('$age anos'),
              );
            }
          )
          )
        ],
      )
    );
  }
}

