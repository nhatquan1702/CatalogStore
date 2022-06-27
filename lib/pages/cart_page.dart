import 'package:catalog_store/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: context.accentColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Cart", style: TextStyle(color: context.accentColor),),
        centerTitle: true,
      ),
    );
  }
}
