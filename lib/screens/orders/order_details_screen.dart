import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/models/MyOrder.dart';
import 'package:stylish/screens/orders/components/order_items_list.dart';

import '../../models/Cart.dart';
import '../checkout/components/checkout_items_list.dart';
import 'components/order_item_images.dart';

class OrderDetailsScreen extends StatefulWidget {
  OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  final MyOrder order;
  List<CartProduct> productList = [];

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool changeButton = false;

  @override
  void initState() {
    convert();
    super.initState();
  }

  void convert() {
    int index = 0;
    CartProduct obj = CartProduct(
        productId: widget.order.orderProducts[0].productId,
        productName: widget.order.orderProducts[0].productName,
        productImg: widget.order.orderProducts[0].productImg,
        productPrice: widget.order.orderProducts[0].productPrice.toString(),
        qty: 1);
    widget.productList.add(obj);
    for (int i = 1; i < widget.order.orderProducts.length; i++) {
      if (widget.order.orderProducts[i].productId ==
          widget.productList[index].productId) {
        widget.productList[index].qty++;
      } else {
        CartProduct obj = CartProduct(
            productId: widget.order.orderProducts[i].productId,
            productName: widget.order.orderProducts[i].productName,
            productImg: widget.order.orderProducts[i].productImg,
            productPrice: widget.order.orderProducts[i].productPrice.toString(),
            qty: 1);
        widget.productList.add(obj);
        index++;
      }
    }
  }

  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Order Details",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(defaultPadding * 2,
            defaultPadding / 2, defaultPadding * 2, defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order# ${widget.order.orderNo}",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: defaultPadding),
            const Divider(
              height: 0,
              color: Colors.grey,
            ),
            const SizedBox(height: defaultPadding),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15),
                    ),
                    Text(
                      widget.order.paymentMethod,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15),
                    ),
                    Text(
                      widget.order.orderDate,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            const Divider(
              height: 0,
              color: Colors.grey,
            ),
            const SizedBox(height: defaultPadding),
            //BillingInfo(cartController: cartController,),
            const SizedBox(height: defaultPadding * 2),
            Text(
              "Items",
              style: Theme.of(context).textTheme.headline6,
            ),
            OrderItemImages(
              productsList: widget.order.orderProducts,
            ),
            const SizedBox(height: defaultPadding),
            OrderItemsList(
              productsList: widget.productList,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15),
                ),
                Text(
                  'Rs. ${widget.order.total}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const CheckoutScreen(),
                        //     ));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, shape: const StadiumBorder()),
                      child: const Text(
                        "Receipt",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const CheckoutScreen(),
                        //     ));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor, shape: const StadiumBorder()),
                      child: const Text("Re Order"),
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
