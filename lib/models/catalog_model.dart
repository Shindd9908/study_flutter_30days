import 'package:study_flutter_30days/models/catalog.dart';

class CatalogModel {

  static final catalogModel = CatalogModel._internal();

  CatalogModel._internal();

  factory CatalogModel() => catalogModel;

  static List<Item> items = [];

  //get Item by id
  Item getById(int id) =>
      // ignore: null_closures
      items.firstWhere((element) => element.id == id, orElse: null);

  //get item by position
  Item getByPosition(int pos) => items[pos];
}
