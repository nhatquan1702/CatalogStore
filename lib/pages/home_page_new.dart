import 'dart:convert';
import 'package:catalog_store/utils/routes.dart';
import 'package:catalog_store/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widget/catalog_haeader.dart';
import '../widgets/home_widget/catalog_list.dart';


class HomePageNew extends StatefulWidget {
  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  bool _isGridMode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.accentColor,
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(CupertinoIcons.shopping_cart, color: context.cardColor,),
      ),
      // appBar: AppBar(
      //   title: const Text("Catalog Store", style: TextStyle(color: Colors.black),),
      //   actions: <Widget>[
      //     if (_isGridMode)
      //       IconButton(
      //         icon: const Icon(Icons.grid_on),
      //         onPressed: () {
      //           setState(() {
      //             _isGridMode = false;
      //           });
      //         },
      //       )
      //     else
      //       IconButton(
      //         icon: const Icon(Icons.list),
      //         onPressed: () {
      //           setState(() {
      //             _isGridMode = true;
      //           });
      //         },
      //       ),
      //   ],
      // ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand()
            ],
          ),
        ),
      ),
    );
  }
  void loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalogs.json");
    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    // print(productData);
    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState((){});
  }
}












