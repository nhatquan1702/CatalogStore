import 'package:catalog_store/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../widgets/theme.dart';
import 'catalog_image.dart';
class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, indiex){
        final catalog = CatalogModel.items![indiex];
        return InkWell(//InkWell nút có hiệu ứng gợn sóng
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailPage(catalog: catalog))),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({required this.catalog})
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(// tạo hiệu ứng thu phóng
              tag: Key(catalog.id.toString()),
              child: CatalogImage(
                imgUrl: catalog.image,
              ),
            ),
            //thuộc tính cha là row nên bên trái là ảnh, bên phải là các thông tin chia ui bằng column dưới đây
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    catalog.name.text.lg.color(context.accentColor).bold.make(),
                    catalog.desc.text.textStyle(context.captionStyle).make(),
                    10.heightBox, // vẽ hộp trống cao 10dp
                    //giá và nút mua sẽ trong buttonbar
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween, // chia đều bởi không gian trống giữa
                      buttonPadding: EdgeInsets.zero,
                      children: [
                        "${catalog.price}\$".text.bold.xl.make(),
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                context.theme.accentColor, // đổi màu
                              ),
                              shape: MaterialStateProperty.all(
                                StadiumBorder(), //và bo lại nút buy
                              )),
                          child: "Buy".text.color(context.cardColor).make(),
                        )
                      ],
                    ).pOnly(right: 8.0) //cho cái nút cách phải 8dp
                  ],
                ))
          ],
        )
    ).color(context.cardColor).rounded.square(150).make().py16();
    //vbox.white là viền trắng toàn màn hình
    //rounded là bo 4 góc
    //py16 là chia cách nhau 16dp
    //square 150 là
  }
}
