import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
import '../widgets/theme.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({required this.catalog})
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: context.accentColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container( // thanh bottom dưới chứa giá và nút buy
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "${catalog.price}\$".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                  context.accentColor,
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Add to cart".text.color(context.cardColor).make(),
            ).wh(120, 50)
          ],
        ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero( // tạo hiệu ứng thu phóng
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc( // vẽ hộp dưới
                  height: 30.0,
                  arcType: VxArcType.CONVEY, //cong
                  edge: VxEdge.TOP, // con cạnh top
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(context.accentColor)
                            .bold
                            .make(),
                        catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                        10.heightBox,
                        Text("Dolor sea takimata ipsum sea eirmod aliquyam est. Eos ipsum voluptua eirmod elitr, no dolor dolor amet eirmod dolor labore dolores magna. Amet vero vero vero kasd, dolore sea sed sit invidunt nonumy est sit clita. Diam aliquyam amet tempor diam no aliquyam invidunt. Elitr lorem eirmod dolore clita. Rebum."
                        ).text.textStyle(context.captionStyle).make().px16()
                      ],
                    ).py32(),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}