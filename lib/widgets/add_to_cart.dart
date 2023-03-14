import 'package:flutter/material.dart';
import 'package:flutter_learn/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/cart.dart';
import '../models/catelog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    final _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog) ? true : false;
    // for(int i=0 ; i < _cart.items.length ; i++){
    //   print(_cart.items[i]);
    // }
    return ElevatedButton(                                                  //need to be redraw
        onPressed: () {
          if(!isInCart) {
            AddMutation(catalog);
            isInCart = isInCart.toggle();
            // _cart.catelog = _catalog;             //set item
            // _cart.add(catalog);                   //added to list
            // setState(() {});
            // print(_cart.items.length);
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart ? Icon(Icons.done) : "Add to Cart".text.make());
  }
}
