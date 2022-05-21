import 'package:get/get.dart';
import 'package:stylish/models/Product.dart';

class WishlistController extends GetxController {
  var wishlistProducts = [].obs;

  void addProductToWishlist(Product product) {
    if (!wishlistProducts.contains(product)) {
      wishlistProducts.add(product);
    } else {
      wishlistProducts.removeWhere((element) => element == product);
    }
  }

  get products => wishlistProducts;

  void removeProductFromWishlist(Product product) {
    wishlistProducts.removeWhere((element) => element == product);
  }

// get subTotal =>
//     wishlistProducts.entries.map((product) => product.key.price * product.value)
//         .toList();
//
// get total =>
//     wishlistProducts.entries.map((product) => product.key.price * product.value)
//         .toList().reduce((value, element) => value + element).toString();

}
