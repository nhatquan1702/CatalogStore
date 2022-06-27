import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/theme.dart';
class CatalogImage extends StatelessWidget {
  final String imgUrl;
  const CatalogImage({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(imgUrl).box.rounded.p16.color(context.canvasColor).make().p16().w40(context);
    //box là vẽ hộp
    //p16 là padding tấm hình vào 16dp
    //rounded bo góc
    //p16() sau là padding hộp vào 16dp so với box lớn ở ngoài
    //w40 cho tất cả ảnh đều wrap về 40 đều nhau
  }
}