// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class SearchPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppbar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Busque uma cidade',
          hideSearch: true
        ),
        drawer: CustomDrawer(
          pageContext: context
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text('Página de busca...')
            ],
          )
        ),
      )
    );
  }
}