import 'package:flutter_learn/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartModel {
  late CatelogModel _catelog;

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
  List<Item> get items => _itemIds.map((id) => _catelog.getById(id)).toList();

//total price
  num get totalPrice =>
      items.fold(0, (totalPrice, current) => totalPrice + current.price);

//add items
  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
