import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/models/Cart.dart';

import '../checkout/checkout_screen.dart';
import 'components/cart_product_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "My Cart",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            defaultPadding * 2, 0.0, defaultPadding * 2, defaultPadding * 2),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => (cartController.cartProducts.isNotEmpty)
                    ? GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 3,
                        ),
                        itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding / 2),
                            child: CartProductCard(
                              cartController: cartController,
                              product: cartController.cartProducts.keys
                                  .toList()[index],
                              qty: cartController.cartProducts.values
                                  .toList()[index],
                            )),
                        itemCount: cartController.cartProducts.length,
                        scrollDirection: Axis.vertical,
                      )
                    : Center(
                        child: Text(
                          "Cart is Empty",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                        ),
                      ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Subtotal:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Obx(
                          () => (cartController.cartProducts.isNotEmpty)
                              ? Text(
                                  "\$${cartController.total}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                )
                              : Text(
                                  "\$0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding * 2),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (cartController.cartProducts.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CheckoutScreen(),
                              ));
                        } else {
                          Get.snackbar(
                            "Cart is Empty",
                            "",
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 1),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor, shape: const StadiumBorder()),
                      child: const Text("Check Out"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
