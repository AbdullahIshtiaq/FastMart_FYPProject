import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/checkout/components/billing_info.dart';
import 'package:stylish/screens/payment/payment_successful_screen.dart';
import 'package:stylish/utils/shared_preferences.dart';

import '../../models/Cart.dart';
import 'components/checkout_items_list.dart';
import 'components/payment_methods.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool changeButton = false;

  CartController cartController = Get.put(CartController());

  onProceedClick(BuildContext context) async {
    UserSharedPreferences.deleteCartList();
    setState(() {
      changeButton = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    // await Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const PaymentSuccessfulScreen(),
    //     ));
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => PaymentSuccessfulScreen(
                  cartController: cartController,
                )),
        (Route<dynamic> route) => false);
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
          "Checkout",
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
              "Your Items",
              style: Theme.of(context).textTheme.headline6,
            ),
            CheckoutItemsList(
              cartController: cartController,
            ),
            const SizedBox(height: defaultPadding * 2),
            Text(
              "Billing Information",
              style: Theme.of(context).textTheme.headline6,
            ),
            BillingInfo(
              cartController: cartController,
            ),
            const SizedBox(height: defaultPadding * 2),
            Text(
              "Payment Methods",
              style: Theme.of(context).textTheme.headline6,
            ),
            const PaymentMethods(),
            //const SizedBox(height: defaultPadding * 18),
            const Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: defaultPadding),
                child: Material(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 50),
                  child: InkWell(
                    onTap: () => onProceedClick(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 50,
                      width: changeButton ? 50 : 200,
                      alignment: Alignment.center,
                      child: changeButton
                          ? const Icon(
                              CupertinoIcons.checkmark_shield_fill,
                              color: Colors.white,
                            )
                          : Text(
                              "Proceed",
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
