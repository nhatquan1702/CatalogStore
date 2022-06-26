import 'package:flutter/material.dart';

import '../models/catalog.dart';
class ItemWidgetGridview extends StatelessWidget {
  final Item item;

  const ItemWidgetGridview({required this.item})
      : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        child: GridTile(
          header: Container(
            child: Text(
              item.name,
              style: const TextStyle(color: Colors.white),
            ),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
            ),
          ),
          child: Image.network(
            item.image,
            fit: BoxFit.fill,
          ),
          footer: Container(
            child: Text(
              item.price.toString()+"\$",
              style: const TextStyle(color: Colors.white),
            ),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
        )
    );
  }
}
