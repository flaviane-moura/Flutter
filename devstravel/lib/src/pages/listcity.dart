// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, unused_local_variable, avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class ListCityPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  void cityBoxAction (pageContenxt, cityData) {
    Navigator.pushNamed(pageContenxt, '/city', arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    final continentIndex = ModalRoute.of(context)?.settings.arguments;

    return Consumer<AppData> (
      builder: (ctx, appdata, child) {
        var cities = [];
        for (var country in appdata.data[continentIndex as int]['countries']){
          cities.addAll(country['cities']);
        }
        
        return Scaffold (
          key: _scaffoldKey,
          appBar: CustomAppbar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: '${appdata.data[continentIndex]['name']} (${cities.length} cidades)',
            showBack: true
          ),
          drawer: CustomDrawer(
            pageContext: context
          ),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(cities.length, (index) {
              return CityBox(
                data: cities[index], 
                onTap: (cityData) {
                  cityBoxAction(context, cityData);
                }
              );
            }),
          )
        );
      }
    );
  }
}