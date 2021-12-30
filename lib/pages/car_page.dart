import 'package:flutter/material.dart';
import 'package:study_flutter_30days/core/store.dart';
import 'package:study_flutter_30days/models/car.dart';
import 'package:velocity_x/velocity_x.dart';

class CarPage extends StatelessWidget {
  const CarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cartModel;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(context.theme.colorScheme.secondary)
              .make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying not supported yet.".text.make()),
              );
            },
            // ignore: deprecated_member_use
            style: ButtonStyle(
              backgroundColor:
                  // ignore: deprecated_member_use
                  MaterialStateProperty.all(context.theme.backgroundColor),
            ),
            // ignore: deprecated_member_use
            child: "Buy".text.white.make(),
          ).w32(context),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _CartList extends StatelessWidget {
  //final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cartModel;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                onPressed: () => RemoveMutation(_cart.items[index]),
                icon: const Icon(Icons.remove_circle_outline),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
