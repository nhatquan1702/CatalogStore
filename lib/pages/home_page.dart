import 'package:catalog_store/widgets/drawer.dart';
import 'package:catalog_store/widgets/item_widget.dart';
import 'package:flutter/material.dart';

import '../models/catalog.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dummyList = List.generate(18, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
         title: const Text("Catalog Store", style: TextStyle(color: Colors.black),),
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index){
          return ItemWidget(item: dummyList[index]);
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
