import 'package:flutter_learn/models/catelog.dart';

class CartModel {
  late CatelogModel _catelog;

  // //singleton
  // static final cartModel  = CartModel()._interal();
  // _interal() {}                                                // constructor
  // factory CartModel() => cartModel;



  //to store id
  final List<int> _itemIds = [];

  //getter
  CatelogModel get catelog => _catelog;

  //setter
  set catelog(CatelogModel catelogModel) {
    assert(catelogModel != null);
    _catelog = catelogModel;
  }

  //get item in cart
  List<Item> get items =>
      _itemIds.map((id) => _catelog.getById(id)).toList();

//total price
  num get totalPrice =>
      items.fold(0, (total, current) => totalPrice + current.price);

//add items
  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
