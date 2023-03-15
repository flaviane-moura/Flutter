// ignore_for_file: sort_child_properties_last, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

Widget CustomDrawer({
  required BuildContext pageContext
}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'DevsTravel', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Helvetica Neue'
                )
              ),
              Text(
                'versão 1.0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Helvetica Neue'
                )
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.green
          ),
        ),

        ListTile(
          leading: Icon(Icons.home, color: Colors.black),
          title: Text('Home'),
          onTap: (){
            Navigator.pushReplacementNamed(pageContext, '/home');
          },
        ),

        ListTile(
          leading: Icon(Icons.public, color: Colors.black),
          title: Text('Escolher Continente'),
          onTap: (){
            Navigator.pushReplacementNamed(pageContext, '/continente');
          },
        ),

        ListTile(
          leading: Icon(Icons.search, color: Colors.black),
          title: Text('Buscar Cidade'),
          onTap: (){
            Navigator.pushReplacementNamed(pageContext, '/search');
          },
        ),

        ListTile(
          leading: Icon(Icons.favorite, color: Colors.black),
          title: Text('Cidades Salvas'),
          onTap: (){
            Navigator.pushReplacementNamed(pageContext, '/favorites');
          },
        )
      ],
    ),
  );
}