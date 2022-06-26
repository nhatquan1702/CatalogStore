import 'dart:convert';

import 'package:catalog_store/widgets/drawer.dart';
import 'package:catalog_store/widgets/item_widget.dart';
import 'package:catalog_store/widgets/item_widget_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/catalog.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isGridMode = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {

    //final dummyList = List.generate(18, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
         title: const Text("Catalog Store", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          if (_isGridMode)
            IconButton(
              icon: const Icon(Icons.grid_on),
              onPressed: () {
                setState(() {
                  _isGridMode = false;
                });
              },
            )
          else
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                setState(() {
                  _isGridMode = true;
                });
              },
            ),
        ],
      ),
      body: _isGridMode ? GridBuilder() : ListBuilder(),
      drawer: MyDrawer(),
    );
  }

  void loadData() async{
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalogs.json");
    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    // print(productData);
    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState((){

    });
  }
}

class ListBuilder extends StatefulWidget {
  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  void _toggle(int index) {
      setState(() {
        print(CatalogModel.items![index].name);
      });
  }

  @override
  Widget build(BuildContext context) {
    return (CatalogModel.items != null && CatalogModel.items!.isNotEmpty) ? ListView.builder(
        itemCount: CatalogModel.items!.length,
        itemBuilder: (_, int index) {
          return ItemWidget(item: CatalogModel.items![index]);
        }) : const Center(child: CircularProgressIndicator(),
    );
  }
}

class GridBuilder extends StatefulWidget {
  @override
  GridBuilderState createState() => GridBuilderState();
}

class GridBuilderState extends State<GridBuilder> {
  void _toggle(int index) {
      setState(() {
        print(CatalogModel.items![index].name);
      });
  }

  @override
  Widget build(BuildContext context) {
    return (CatalogModel.items != null && CatalogModel.items!.isNotEmpty) ? GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final item = CatalogModel.items![index];
        return ItemWidgetGridview(item: CatalogModel.items![index]);
      },
      itemCount: CatalogModel.items!.length,
    ) : const Center(
      child: const CircularProgressIndicator(),
    );
  }
}




