import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) =>
      ThemeData(
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black),
            centerTitle: true,
          )
      );


  // static ThemeData darkTheme(BuildContext context) => ThemeData(
  //     primarySwatch: Colors.orange,
  //     appBarTheme: AppBarTheme(
  //       color :Colors.white,
  //       elevation: 0.0,
  //       iconTheme: IconThemeData(color: Colors.black),
  //       textTheme: Theme.of(context).textTheme,
  //     )
  // );
  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(
          brightness: Brightness.dark,
          cardColor: Colors.black,
          canvasColor:creamColorDark,
        buttonColor: Colors.lightBlue,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.black54,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme.copyWith(
            headline6: context.textTheme.headline6?.copyWith(color: Colors.white)
          )
        )
      );

  // Color creamColor = const Color;
  Color c1 = const Color(0xFF42A5F5);

  static Color creamColor = const Color(0xFFF5f5f5);
  static Color creamColorDark = Vx.gray900;
  static Color darkBluish = const Color(0xFF403b58);
}
