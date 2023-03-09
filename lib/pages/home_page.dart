import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/pages/detail_page.dart';
import 'package:flutter_learn/utils/routes/MyRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/widgets/item_widget.dart';
import '../models/catelog.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loaFileDate();
  }

  void loaFileDate() async {
    var jsonString = await rootBundle.loadString("assets/files/catalog.json");
    var decodeString = jsonDecode(jsonString)["products"]; // in object format
    // print(decodeString);
    //mapping
    CatelogModel.items = List.from(decodeString)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var days = 30;
    const String name = "Avinash";
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: Icon(CupertinoIcons.cart),
        backgroundColor: Colors.grey,
      ),
      appBar: AppBar(
        title: const Text("Category App"),
      ),
      body: Material(
        child: (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
            ? GridView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: CatelogModel.items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = CatelogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                  onTap: () {
                    // print("${CatelogModel.items[index].desc}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(),
                          settings: RouteSettings(
                              arguments: CatelogModel.items[index]
                          )
                      ),
                    );
                  },
                  child: GridTile(
                      header: Container(
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.deepPurple),
                      child: Hero(
                          tag: Key(item.id.toString()),
                          child: Image.network(item.image)),
                  footer: Container(
                      child: Text(
                        item.price.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.black)),
            ),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10
            )
            ,
            )
            ,
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
