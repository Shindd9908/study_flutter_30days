import 'package:study_flutter_30days/models/catalog_model.dart';

import 'catalog.dart';


class CartModel {
  //Catalog field
  late CatalogModel _catalogModel;

  //collection of IDs
  final List<int> _itemIds = [];

  //get catalog
  // ignore: recursive_getters, unnecessary_getters_setters
  CatalogModel get catalog => _catalogModel;

  set catalog(CatalogModel newCatalog) {
    _catalogModel = newCatalog;
  }

  // Get items in the cart
  List get items => _itemIds.map((id) => _catalogModel.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
