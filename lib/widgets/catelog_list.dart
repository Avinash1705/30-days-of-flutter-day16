import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/models/catelog.dart';
import 'package:flutter_learn/pages/detail_page.dart';
import 'package:flutter_learn/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'add_to_cart.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: CatelogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatelogModel.items[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(),
                      settings:
                          RouteSettings(arguments: CatelogModel.items[index])));
            },
            child: CatelogItem(catelog: catalog),
          );
        });
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({Key? key, required this.catelog})
      : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Hero(
            tag: Key(catelog.id.toString()),
            child:
                Image.network(catelog.image).h16(context).w16(context).p(10)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catelog.name.text.lg.color(context.accentColor).bold.make(),
            catelog.desc.text.lg.textStyle(context.captionStyle).bold.make(),
            10.heightBox,
            Container(
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catelog.price}".text.bold.xl.make(),
                  AddToCart(catalog: catelog)
                ],
              ).pOnly(right: 10.0),
            ),
          ],
        ))
      ],
    )).cornerRadius(150).color(context.cardColor).p16();
  }
}
