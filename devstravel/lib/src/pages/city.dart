// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class CityPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> cityData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;;

    print(cityData['places']);

    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppbar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Tela Cidade'
        ),
        drawer: CustomDrawer(
          pageContext: context
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Text('...')
        ),
      )
    );
  }
}