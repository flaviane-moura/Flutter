// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

PreferredSize CustomAppbar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight),
    child: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      //centerTitle: false,   <--- não precisa porque nesta versão do Flutter já starta false como padrão
      title: Text(
        'AppBar Personalizado', 
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvetica Neue'
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black, size: 30),
        onPressed: (){},
      ),
      actions: [
        IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.search, color: Colors.black, size: 30)
        )
      ],
    ),
  );
}

