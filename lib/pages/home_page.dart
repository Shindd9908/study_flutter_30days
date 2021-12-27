import 'package:flutter/material.dart';
import 'package:study_flutter_30days/models/catalog_model.dart';
import 'package:study_flutter_30days/widgets/drawer.dart';
import 'package:study_flutter_30days/widgets/items_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final int days = 30;
  final String name = "Shindd";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(4, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
          itemCount: dummyList.length,
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
