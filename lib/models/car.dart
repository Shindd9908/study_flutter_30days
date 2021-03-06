import 'package:study_flutter_30days/core/store.dart';
import 'package:study_flutter_30days/models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;
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
  List<Item> get items =>
      _itemIds.map((id) => _catalogModel.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cartModel._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cartModel._itemIds.remove(item.id);
  }
}
