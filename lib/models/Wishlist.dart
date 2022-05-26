import 'dart:convert';

import 'package:get/get.dart';
import 'package:stylish/models/Product.dart';
import 'dart:developer' as developer;

import '../utils/shared_preferences.dart';

// class WishlistController extends GetxController {
//   var wishlistProducts = [].obs;
//
//   void addProductToWishlist(Product product) {
//     if (!wishlistProducts.contains(product)) {
//       wishlistProducts.add(product);
//     } else {
//       wishlistProducts.removeWhere((element) => element == product);
//     }
//   }
//
//   get products => wishlistProducts;
//
//   void removeProductFromWishlist(Product product) {
//     wishlistProducts.removeWhere((element) => element == product);
//   }
// }

List<WishlistProduct> wishlistFromJson(String str) => List<WishlistProduct>.from(
    json.decode(str).map((x) => WishlistProduct.fromJson(x)));

class WishlistProduct {
  WishlistProduct({
    required this.productId,
    required this.productName,
    required this.productImg,
    required this.productPrice,
  });

  late final String productId;
  late final String productName;
  late final String productImg;
  late final String productPrice;

  WishlistProduct.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productImg = json['productImg'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['productId'] = productId;
    _data['productName'] = productName;
    _data['productImg'] = productImg;
    _data['productPrice'] = productPrice;
    return _data;
  }
}

class WishlistController extends GetxController {
  var wishlistProducts = [].obs;

  @override
  void onInit() {
    String str = UserSharedPreferences.getWishList() ?? "";
    if (str != "") {
      List<WishlistProduct> list = wishlistFromJson(str);

      wishlistProducts.clear();
      wishlistProducts.addAll(
        list.where(
              (cartProducts) => list.every((item) => true),
        ),
      );
      developer.log('log me 53: $wishlistProducts', name: 'my.app.productDetail');
    }
    super.onInit();
  }

  void addProductToWishlist(WishlistProduct product) {
    for (var item in  wishlistProducts) {
      if (item.productId == product.productId) {
        wishlistProducts
            .removeWhere((element) => element.productId == product.productId);
        update();
        return;
      }
    }
    wishlistProducts.add(WishlistProduct(
        productId: product.productId,
        productImg: product.productImg,
        productName: product.productName,
        productPrice: product.productPrice,));
    update();
  }

  get products =>  wishlistProducts;

  void removeProductFromWishlist(WishlistProduct product) {
    wishlistProducts
        .removeWhere((element) => element.productId == product.productId);
    update();
  }

}

