// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Post {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic>json){
    return Post(
      userId: json['userId'], 
      id: json['id'], 
      title: json['title'], 
      body: json['body']
    );

  }
}

Future<Post> pegarPost() async {
  
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
  );

  if(response.statusCode == 200){
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Falhou na requisição de post');
  }
}

class TestePage extends StatefulWidget {
  @override
  _TestePage createState() => _TestePage();
}

class _TestePage extends State<TestePage>{

  Future<Post>? postagem;

  @override
  void initState(){
    super.initState();
    postagem = pegarPost();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Teste')
      ),
      body: Center(
        child: FutureBuilder<Post>(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return CircularProgressIndicator();
            }
          },
          future: postagem,
        )
      )
    );
  }

}