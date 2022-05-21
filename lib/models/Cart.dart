import 'package:get/get.dart';
import 'package:stylish/models/Product.dart';

class CartController extends GetxController {

  var cartProducts = {}.obs;

  void addProductToCart(Product product) {
    if (cartProducts.containsKey(product)) {
      cartProducts[product] += 1;
    } else {
      cartProducts[product] = 1;
    }
  }

  get products => cartProducts;

  void minusProductFromCart(Product product) {
    if (cartProducts.containsKey(product) && cartProducts[product] == 1) {
      //cartProducts.removeWhere((key, value) => key == product);
    } else {
      cartProducts[product] -= 1;
    }
  }

  void removeProductFromCart(Product product) {
    cartProducts.removeWhere((key, value) => key == product);
  }

  get subTotal =>
      cartProducts.entries.map((product) => product.key.price * product.value)
          .toList();

  get total =>
      cartProducts.entries.map((product) => product.key.price * product.value)
          .toList().reduce((value, element) => value + element).toString();
}