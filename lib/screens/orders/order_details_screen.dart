import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/payment/payment_successful_screen.dart';

import '../../models/Cart.dart';
import '../checkout/components/checkout_items_list.dart';
import 'components/order_item_images.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool changeButton = false;

  CartController cartController = Get.put(CartController());

  onProceedClick(BuildContext context) async {
    setState(() {
      changeButton = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PaymentSuccessfulScreen(),
        ));
    setState(() {
      changeButton = false;
    });
  }

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
              "Order# ERD456G7HT6R",
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
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15
                      ),
                    ),
                    Text(
                      "Credit Card",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15
                      ),
                    ),
                    Text(
                      "02-05-2022",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15
                      ),
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
            const OrderItemImages(),
            const SizedBox(height: defaultPadding),
            CheckoutItemsList(cartController: cartController),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15
                  ),
                ),
                Text(
                  '\$5000',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 15
                  ),
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
                      child: const Text("Receipt", style: TextStyle(color: Colors.black),),
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
