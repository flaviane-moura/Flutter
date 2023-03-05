// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'stores/contador.dart';

part 'pages/home.dart';
part 'pages/sobre.dart';

final contador = Contador();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/sobre': (context) => SobreScreen()
      }
    );
  }
}
