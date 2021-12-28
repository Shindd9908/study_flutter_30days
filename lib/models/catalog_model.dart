import 'package:study_flutter_30days/models/catalog.dart';

class CatalogModel {
  static List<Item> items = [];

  //get Item by id
  static Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //get item by position
  static Item getByPosition(int pos) => items[pos];
}
