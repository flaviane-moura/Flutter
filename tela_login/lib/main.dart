// ignore_for_file: prefer_const_constructors, unnecessary_this, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, avoid_print, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, sort_child_properties_last
import 'package:flutter/material.dart';
import 'src/models/contador.dart';
import 'package:provider/provider.dart';
import 'src/help.dart';
import 'src/home.dart';
import 'src/login.dart';


void main() => runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>Contador()),
    ],
    child: MeuApp(),
  )
);

class MeuApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
        '/help': (context) => HelpPage(),
        '/login': (context) => LoginPage()
      },
      initialRoute: '/home',
    );
  }
}
