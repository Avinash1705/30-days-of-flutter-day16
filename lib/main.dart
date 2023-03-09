import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/cart_page.dart';
import 'package:flutter_learn/pages/detail_page.dart';
import 'package:flutter_learn/pages/home_page.dart';
import 'package:flutter_learn/pages/login_page.dart';
import 'package:flutter_learn/utils/routes/MyRoutes.dart';
import 'package:flutter_learn/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/home",
      routes: {
    MyRoutes.loginRoute:(context) => LoginPage(),
    MyRoutes.homeRoute:(context)  => HomePage(),
    MyRoutes.loginRoute :(context) => LoginPage(),
    MyRoutes.detailRoute :(context) => DetailPage(),
    MyRoutes.cartRoute :(context) => CartPage(),
    },
    );
  }
}
