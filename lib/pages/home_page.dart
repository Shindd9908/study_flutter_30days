import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_flutter_30days/core/store.dart';
import 'package:study_flutter_30days/models/car.dart';
import 'package:study_flutter_30days/models/catalog.dart';
import 'package:study_flutter_30days/models/catalog_model.dart';
import 'package:study_flutter_30days/utils/routes.dart';
import 'package:study_flutter_30days/values/app_theme.dart';
import 'package:study_flutter_30days/widgets/home_widgets/catalog_header.dart';
import 'package:study_flutter_30days/widgets/home_widgets/catalog_list.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Shindd";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cartModel;
    //final dummyList = List.generate(4, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: AppTheme.darkBluishColor,
          child: const Icon(CupertinoIcons.cart),
        ),
      ).badge(
        color: Vx.gray200,
        size: 22,
        count: _cart.items.length,
        textStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                Center(
                  child: const CircularProgressIndicator()
                      .centered()
                      .py16()
                      .expand(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
