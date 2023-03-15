// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/material.dart';

PreferredSize CustomAppbar({
  required GlobalKey<ScaffoldState> scaffoldKey,
  required BuildContext pageContext,
  String title = '',
  bool hideSearch = false,
  bool showBack = false
}) {

  void searchAction (){
    Navigator.pushReplacementNamed(pageContext, '/search');
  }

  IconButton drawerIcon = IconButton(
    icon: Icon(Icons.menu, color: Colors.black, size: 30),
    onPressed: (){
      scaffoldKey.currentState?.openDrawer();
    },
  );

  IconButton backIcon = IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
    onPressed: (){
      Navigator.pop(pageContext);
    },
  );  

  Widget leadingButton = drawerIcon; // inicialização padrão
  if(showBack) {
    leadingButton = backIcon;
  }

  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight),
    child: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      //centerTitle: false,   <--- não precisa porque nesta versão do Flutter já starta false como padrão
      title: Text(
        title, 
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvetica Neue'
        ),
      ),
      leading: leadingButton,
      actions: [
        !hideSearch ? IconButton(
          onPressed: searchAction, 
          icon: Icon(Icons.search, color: Colors.black, size: 30)
        ) : Container()
      ],
    ),
  );
}
