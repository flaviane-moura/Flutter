// ignore_for_file: unused_import, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, avoid_print

//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter1/src/firebase/atualiza.dart';

class FirebaseConsultaPage extends StatefulWidget {

  @override
  _FirebaseConsultaPage createState() => _FirebaseConsultaPage();
}

class _FirebaseConsultaPage extends State<FirebaseConsultaPage> {

  List<dynamic> users = [];

  final dbRef = FirebaseDatabase.instance.ref();

  /*consultar(){
  dbRef.child('users').once().then((DatabaseEvent databaseEvent){
    setState(() {
      if(databaseEvent.snapshot.value != null){
        Map<dynamic, dynamic> values = databaseEvent.snapshot.value as Map<dynamic, dynamic>;
        for(var item in values.values) {
          item['key'] = key;
          users.add(item);
        }
      }
    });
  });
}*/
  consultar() {
    dbRef.child('users').once().then((DatabaseEvent databaseEvent) {
      setState(() {
        if (databaseEvent.snapshot.value != null) {
          Map<dynamic, dynamic> values = databaseEvent.snapshot.value as Map<dynamic, dynamic>;
          values.forEach((key, item) {
            item['key'] = key;
            users.add(item);
          });
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
        children: [
          Expanded(
            child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index){
              var name = users[index]['name'];
              var age = users[index]['age'].toString();
              var key = users[index]['key'];
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(name),
                subtitle: Text('$age anos'),
                onTap: (){
                  Navigator.pushNamed(
                    context,
                    '/firebase_atualiza',
                    arguments: ScreenArguments(name, age, key)
                  );
                },
              );
            }
          )
          )
        ],
      )
    );
  }
}

