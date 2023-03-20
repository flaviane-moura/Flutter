// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/consumo_list.dart';
final consumos = ConsumoList();

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{

  double consumo = 0;

  void _handleConsumoField(String text){
    setState(() {
      if(text != ''){
        consumo = double.parse(text);
      } else {
        consumo = 0;
      }
    });

  }

  void _handleRegistrarButton (){
    if(consumo > 0){
      consumos.addConsumo(consumo);
    }

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Consumo')
      ),
      body: Observer(
        builder: (_) => Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Qual foi o consumo da viagem?'
              ),
              keyboardType: TextInputType.number,
              onChanged: _handleConsumoField
            ), 
            ElevatedButton(
              onPressed: _handleRegistrarButton, 
              child: Text('Registrar $consumo km/h', style: TextStyle(fontWeight: FontWeight.bold))
            ),
            Row(
              children: [
                /*Expanded(
                  child: Column(
                    children: [
                      Text('Consumos Registrados'),
                      Text('${consumos.list.length}')
                    ],
                  )
                ),*/
                Expanded(
                  child: Center(
                    child: Column (
                      children: [
                        Container (
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            children: [
                              Text('Consumos Médio Geral', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text (
                                '${consumos.mediaGeral} km/l',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                        )
                      )
                        
                    ]),
                  )
                )
              ],
            ),
            Text('Registros:'),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: consumos.list.length,
                itemBuilder: (BuildContext ctx, int index){
                  return Text('- ${consumos.list[index]}');
                }
              )
            )
          ],
        )
      )
    );
  }
}
