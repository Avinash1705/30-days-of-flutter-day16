import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/models/catelog.dart';
import 'package:flutter_learn/pages/detail_page.dart';
import 'package:flutter_learn/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';

class CatelogList extends StatefulWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  State<CatelogList> createState() => _CatelogListState();
}

class _CatelogListState extends State<CatelogList> {
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
                child: Image.network(catelog.image)
                    .h16(context)
                    .w16(context)
                    .p(10)),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catelog.name.text.lg.color(context.accentColor).bold.make(),
                catelog.desc.text.lg
                    .textStyle(context.captionStyle)
                    .bold
                    .make(),
                10.heightBox,
                Container(
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${catelog.price}".text.bold.xl.make(),
                    _AddToCart(catelog)
                    ],
                  ).pOnly(right: 10.0),
                ),
              ],
            ))
          ],
        )
    ).cornerRadius(150).color(context.cardColor).p16();
  }
}

class _AddToCart extends StatefulWidget {
  const _AddToCart(Item catelog, {Key? key}) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}
//elevated btn change
class _AddToCartState extends State<_AddToCart> {
  bool isAdded =false ;
  final _cartModel = CartModel();
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed: () {
          isAdded = isAdded.toggle();
          _cartModel.add(catelog);
          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Colors.grey),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isAdded?Icon(Icons.done):"Add to Cart".text.make());
  }
}

