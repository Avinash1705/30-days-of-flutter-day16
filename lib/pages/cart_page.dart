import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../utils/SnackBar.dart';

class CartPage extends StatelessWidget {
  final _cart = CartModel();
   CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
      ),
      body: Column(
        children: [
          _CartList().py32().expand(),
          Divider(
            thickness: 5,
          ),
          _CartTotal()
        ],
      ).py8(),
      bottomNavigationBar: Row(),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const Text("\$${222}").text.xl.color(Colors.brown).make(),
           "\$${_cart.totalPrice}".text.xl.color(Colors.brown).make(),
          30.widthBox,
          // TextButton(onPressed: (){}, child: "Buy".text.xl.make())
          ElevatedButton(
              onPressed: () {
                print("Buyed");
                MySnakBar.snakBarFn(context,"Buying Not Supported");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              ),
              child: "Buy".text.color(MyTheme.creamColor).xl.make())
        ],
      ).px8(),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  //object call
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {},
              ),
          title: _cart.items[index].name.text.make(),
            ));
  }
}
