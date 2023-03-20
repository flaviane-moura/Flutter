// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/citybox.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class FavoritesPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) {
        List favorites = appdata.favoritesCities();
        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppbar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: 'Cidades Salvas'
          ),
          drawer: CustomDrawer(pageContext: context),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(favorites.length, (index) {
              return CityBox(
                data: favorites[index],
                onTap: (cityData) {
                  Navigator.pushNamed(context, '/city', arguments: cityData);
                 },
              );
            }),
         )
       );
      }
    );
  }
}