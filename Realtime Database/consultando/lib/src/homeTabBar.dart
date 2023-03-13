// ignore_for_file: prefer_const_constructors, unnecessary_this, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, avoid_print, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, sort_child_properties_last, file_names
import 'package:flutter/material.dart';
import './help.dart';
import './home.dart';

class HomeTabBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter 1'),
          bottom: TabBar(
            tabs: [
              //Text('Testando...'),
              Tab(text: 'Home', icon: Icon(Icons.home)),
              Tab(text: 'Ajuda', icon: Icon(Icons.help))
            ]
          ),
        ),
        body: TabBarView(
          children: [
            HomePage(),
            HelpPage()
          ]
        )
      ),
    );
  }
}