// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
part of '../main.dart';

class SobreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre')
      ),
      body: Observer(
        builder: (_) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contagem: ${contador.valor}'),
            ElevatedButton(
              onPressed: contador.aumentar, 
              child: Text('Aumentar também')
            )
          ],
        ),
      )
      )
    );
  }
}