// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_constructors_in_immutables

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

Future<List<Post>> pegarPosts() async {
  
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );

  if(response.statusCode == 200){
    return parsePosts(response.body);
  } else {
    throw Exception('Falhou na requisição de post');
  }
}

List<Post> parsePosts(String responseBody){
  var parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

class PostsList extends StatelessWidget {
  final List<Post>? posts;

  PostsList({this.posts});

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: posts?.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.play_arrow),
          title: Text('${posts?[index].title}'),
          subtitle: Text('${posts?[index].body}')
        );
      }
    );

  }

}

class TestePage extends StatefulWidget {
  @override
  _TestePage createState() => _TestePage();
}

class _TestePage extends State<TestePage>{

  Future<List<Post>>? postagens;

  @override
  void initState(){
    super.initState();
    postagens = pegarPosts();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Teste')
      ),
      body: Center(
        child: FutureBuilder<List<Post>>(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return PostsList(
                posts: snapshot.data
              );
            }
            
            return CircularProgressIndicator();
          },
          future: postagens,
        )
      )
    );
  }

}