// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class ContinentPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppbar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Escolha um continente'
        ),
        drawer: CustomDrawer(
          pageContext: context
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemBuilder: (context, index) {
            var cities = [];
            for (var country in appdata.data[index]['countries']){
              cities.addAll(country['cities']);
            }

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text('${appdata.data[index]['name']} (${cities.length})'),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: Text('Ver cidades'),
                      onPressed: () {},
                    )
                  ],
                ),

                Container(
                  height: 130,
                  margin: EdgeInsets.only(bottom: 15),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    itemBuilder: (cityContext, cityIndex){
                      return CityBox(
                        data: cities[cityIndex],
                        onTap: () {

                        }
                      );
                    }
                  ),
                )
              ],
            );
          },
          itemCount: appdata.data.length,
        )
      )
    );
  }
}