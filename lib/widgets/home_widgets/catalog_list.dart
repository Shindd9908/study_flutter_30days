import 'package:flutter/material.dart';
import 'package:study_flutter_30days/models/catalog.dart';
import 'package:study_flutter_30days/models/catalog_model.dart';
import 'package:study_flutter_30days/pages/home_detail_page.dart';
import 'package:study_flutter_30days/values/app_theme.dart';
import 'package:study_flutter_30days/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (contex, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contex) => HomeDetailPage(
                      catalog: catalog,
                    ),
                  ),
                ),
            child: CatalogItem(catalog: catalog));
      },
      itemCount: CatalogModel.items.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(AppTheme.darkBluishColor).bold.make(),
              catalog.desc.text.make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mH8,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppTheme.darkBluishColor),
                          shape:
                              MaterialStateProperty.all(const StadiumBorder())),
                      child: "Add to cart".text.make()),
                ],
              ).pOnly(right: 8.0)
            ],
          )),
        ],
      ),
    ).color(context.cardColor).roundedLg.square(200).make().py16();
  }
}
