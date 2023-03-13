import 'package:flutter_learn/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catelog.dart';

class MyStore extends VxStore {
  late CatelogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatelogModel();
    cart = CartModel();
    cart.catelog = catalog; // cart me cat set
  }
}
