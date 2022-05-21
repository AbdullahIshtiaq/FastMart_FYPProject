import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Cart.dart';
import '../../../models/Product.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    Key? key,
    required this.cartController,
    required this.product,
    required this.qty,
  }) : super(key: key);

  final CartController cartController;
  final Product product;
  final int qty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        //color: Colors.white,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: product.bgColor,
                borderRadius: const BorderRadius.all(
                    Radius.circular(defaultBorderRadius)),
              ),
              child: Image.asset(
                product.image,
                //height: 100,
              ),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                  "\$${product.price}",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.minus_square,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        cartController.minusProductFromCart(product);
                      },
                    ),
                    Text(
                      qty.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(
                          CupertinoIcons.plus_app,
                          color: primaryColor,
                        ),
                        onPressed: () {
                          cartController.addProductToCart(product);
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.delete_solid,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        cartController.removeProductFromCart(product);
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
