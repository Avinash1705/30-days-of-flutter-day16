import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/models/catelog.dart';
import 'package:flutter_learn/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailPage extends StatelessWidget {
  get item => null;

  @override
  Widget build(BuildContext context) {
    final homeArgs = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: ["\$${homeArgs.price}".text.xl4.color(Colors.deepOrange).make()],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
            ),
              onPressed: () {
                print("${homeArgs.name} Clicked");
              },
              child: Text("Buy").text.xl.make())
        ],
      ).p8(),
      backgroundColor: Colors.white70,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(homeArgs.id.toString()),
                  child: Image.network(homeArgs.image))
              .h32(context),
          Expanded(
            child: VxArc(
              height: 25,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                width: context.screenWidth,
                color: MyTheme.creamColor,
                child: Column(
                  children: [
                    homeArgs.name.text.xl4.color(Colors.black87).bold.make(),
                    homeArgs.desc.text.xl.color(Colors.black54).bold.make(),
                  ],
                ).py64(),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
