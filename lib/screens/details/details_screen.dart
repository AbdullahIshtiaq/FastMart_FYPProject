import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/models/Wishlist.dart';
import 'package:stylish/utils/shared_preferences.dart';

import '../../models/Cart.dart';
import '../../models/MyProduct.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final MyProduct product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final cartController = Get.put(CartController());
  final wishlistController = Get.put(WishlistController());

  bool inCart = false;
  bool inWishlist = false;
  late MyProduct product;

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
    for (var item in cartController.cartProducts) {
      if (item.productId == product.productId) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: widget.product.bgColor,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              //wishlistController.addProductToWishlist(product);
              // setState(() {
              //   inWishlist = !inWishlist;
              // });
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
          Padding(
            padding: const EdgeInsets.all(defaultPadding * 2),
            child: Image.network(
              widget.product.fullImagePath,
              height: MediaQuery.of(context).size.height * 0.4,
              //fit: BoxFit.cover,
            ),
          ),
          // Image.asset(
          //   widget.product.image,
          //   height: MediaQuery.of(context).size.height * 0.4,
          //   fit: BoxFit.cover,
          // ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding * 2,
                  defaultPadding * 2, defaultPadding * 2, defaultPadding),
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
                          widget.product.productName,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Text(
                        "\$" + widget.product.productPrice.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      widget.product.productShortDesc.toString(),
                    ),
                  ),
                  const SizedBox(height: defaultPadding * 8),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          CartProduct model = CartProduct(
                              productId: product.productId,
                              productImg: product.fullImagePath,
                              productName: product.productName,
                              productPrice: product.productPrice.toString(),
                              qty: 1);

                          if (inCart) {
                            Get.snackbar(
                              "Removed Successfully",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 1),
                            );

                            cartController.removeProductFromCart(model);
                            UserSharedPreferences.setCartList(
                                cartController.cartProducts);
                          } else {
                            Get.snackbar(
                              "Added Successfully",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 1),
                            );

                            cartController.addProductToCart(model);
                            //print(cartController.cartProducts);
                            UserSharedPreferences.setCartList(
                                cartController.cartProducts);
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
