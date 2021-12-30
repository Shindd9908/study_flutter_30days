import 'package:study_flutter_30days/models/car.dart';
import 'package:study_flutter_30days/models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalogModel;
  late CartModel cartModel;

  MyStore() {
    catalogModel = CatalogModel();
    cartModel = CartModel();
    cartModel.catalog = catalogModel;
  }
}
