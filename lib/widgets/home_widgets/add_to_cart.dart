import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter_30days/core/store.dart';
import 'package:study_flutter_30days/models/car.dart';
import 'package:study_flutter_30days/models/catalog.dart';
import 'package:study_flutter_30days/values/app_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  //final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cartModel;

    bool isInCart = _cart.items.contains(catalog);

    return ElevatedButton(
      onPressed: () {
        //isInCart = isInCart.toggle();
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppTheme.darkBluishColor),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
