import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/catelog.dart';

class ItemWiget extends StatelessWidget {
  final Item item;

  const ItemWiget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        onTap: (){
          print(item.name);
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price} ",
          textScaleFactor: 1.3,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
      ),
    );
  }
}
