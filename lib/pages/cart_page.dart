import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/cart.dart';
import '../utils/SnackBar.dart';

class CartPage extends StatelessWidget {

  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // for(int i = 0 ;i<_cart.items.length;i++){
    //   // print(_cart.items[i].price);
    // }
    // print(_cart.totalPrice);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
      ),
      body: Column(
        children: [
          _CartList().py32().expand(),
          const Divider(
            thickness: 5,
          ),
          _CartTotal().expand()
        ],
      ).py8(),
      bottomNavigationBar: Row(),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {

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
                MySnakBar.snakBarFn(context, "Buying Not Supported");
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

class _CartList extends StatelessWidget {
  //object call
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    // print(_cart.items.length);
    return _cart.items.isEmpty
        ? "Nothing In Cart".text.xl4.make()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: (Image.network(_cart.items[index].image)),
                  subtitle: _cart.items[index].price.text.make(),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                    },
                  ),
                  // title: _cart.items[index].name.text.make(),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
