import 'package:study_flutter_30days/models/catalog.dart';

class CatalogModel {
  static List<Item> items = [];

  //get Item by id
  Item getById(int id) =>
      // ignore: null_closures
      items.firstWhere((element) => element.id == id, orElse: null);

  //get item by position
  Item getByPosition(int pos) => items[pos];
}
