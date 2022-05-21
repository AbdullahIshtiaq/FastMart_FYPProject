import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/models/Wishlist.dart';

import '../../models/Cart.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final cartController = Get.put(CartController());
  final wishlistController = Get.put(WishlistController());

  bool inCart = false;
  bool inWishlist = false;
  late Product product;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    inCart = checkInCart();
    inWishlist = checkInWishlist();
  }

  bool checkInWishlist() {
    if (wishlistController.wishlistProducts.contains(product)) {
      return true;
    } else {
      return false;
    }
  }

  bool checkInCart() {
    if (cartController.cartProducts.containsKey(product)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.product.bgColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              wishlistController.addProductToWishlist(product);
              setState(() {
                inWishlist = !inWishlist;
              });
            },
            icon: Icon(
              inWishlist ? CupertinoIcons.heart_solid : CupertinoIcons.heart,
              color: primaryColor,
              size: 20,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            widget.product.image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Text(
                        "\$" + widget.product.price.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.",
                    ),
                  ),
                  const SizedBox(height: defaultPadding * 8),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (inCart) {
                            Get.snackbar(
                              "Removed Successfully",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 1),
                            );
                            cartController.removeProductFromCart(product);
                          } else {
                            Get.snackbar(
                              "Added Successfully",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 1),
                            );
                            cartController.addProductToCart(product);
                          }
                          setState(() {
                            inCart = !inCart;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: const StadiumBorder()),
                        child: inCart
                            ? const Text("Remove from Cart")
                            : const Text("Add to Cart"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
