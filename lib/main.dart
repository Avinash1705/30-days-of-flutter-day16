import 'package:flutter/material.dart';
import 'package:flutter_learn/core/store.dart';
import 'package:flutter_learn/pages/api_hit_page.dart';
import 'package:flutter_learn/pages/'
    'cart_page.dart';
import 'package:flutter_learn/pages/detail_page.dart';
import 'package:flutter_learn/pages/home_page.dart';
import 'package:flutter_learn/pages/login_page.dart';
import 'package:flutter_learn/utils/routes/MyRoutes.dart';
import 'package:flutter_learn/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
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
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.detailRoute: (context) => DetailPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        MyRoutes.apiRoute: (context) => const ApiHit(),

      },
    );
  }
}
