import 'package:flutter/material.dart';
import 'package:stylish/models/Cart.dart';

import '../../../constants.dart';

class CheckoutItemsList extends StatelessWidget {
  const CheckoutItemsList({
    Key? key,
    required this.cartController,
  }) : super(key: key);

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      child: SingleChildScrollView(
        child: Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 10,
            ),
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: Title(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "${cartController.cartProducts.keys.toList()[index].title} "
                            "(${cartController.cartProducts.values.toList()[index]})"),
                    Text(
                        "\$${cartController.cartProducts.keys.toList()[index].price}"),
                  ],
                ),
              ),
            ),
            itemCount: cartController.cartProducts.length,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
