import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/models/Wishlist.dart';

import '../../../constants.dart';
import '../../../models/Cart.dart';
import '../../details/details_screen.dart';

class WishlistProductCard extends StatefulWidget {
  const WishlistProductCard({
    Key? key,
    required this.wishlistController,
    required this.product,
    required this.index,
  }) : super(key: key);

  final WishlistController wishlistController;
  final Product product;
  final int index;

  @override
  State<WishlistProductCard> createState() => _WishlistProductCardState();
}

class _WishlistProductCardState extends State<WishlistProductCard> {
  late Product product;

  final cartController = Get.put(CartController());
  bool inCart = false;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    inCart = checkInCart();
    setState(() {});
  }

  bool checkInCart() {
    // if (cartController.cartProducts.containsKey(product)) {
    //   return true;
    // } else {
    //   return false;
    // }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                  product:
                      widget.wishlistController.wishlistProducts[widget.index]),
            )).then((_) => setState(() {
              inCart = checkInCart();
            }));
      },
      child: Container(
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
                decoration: const BoxDecoration(
                  color: bgColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(defaultBorderRadius)),
                ),
                child: Image.asset(
                  widget.product.image,
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
                    widget.product.title,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Text(
                    "\$${widget.product.price}",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                      inCart
                          ? Icons.download_done_outlined
                          : CupertinoIcons.cart_fill_badge_plus,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      // if (inCart) {
                      //   Get.snackbar(
                      //     "Already In Cart",
                      //     "",
                      //     snackPosition: SnackPosition.BOTTOM,
                      //     duration: const Duration(seconds: 1),
                      //   );
                      // } else {
                      //   Get.snackbar(
                      //     "Added Successfully",
                      //     "",
                      //     snackPosition: SnackPosition.BOTTOM,
                      //     duration: const Duration(seconds: 1),
                      //   );
                      //   cartController.addProductToCart(widget.product);
                      //   setState(() {
                      //     inCart = true;
                      //   });
                      // }
                    },
                  ),
                  Expanded(
                    child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.delete_solid,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        widget.wishlistController
                            .removeProductFromWishlist(widget.product);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
