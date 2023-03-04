// ignore_for_file: prefer_const_constructors, unnecessary_this, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, avoid_print, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/contador.dart';


class HelpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título de HELP'),
      ),
      body: Center(
        child: Consumer<Contador>(
          builder: (context, contador, child) => Text(
            'Nome: ${contador.nome}'
          )
        )
        )
    );
  }
}