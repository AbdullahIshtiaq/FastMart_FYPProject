import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/main.dart';

import '../../models/Cart.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  const PaymentSuccessfulScreen({Key? key, required this.cartController})
      : super(key: key);

  final CartController cartController;

  Future<void> _clearCartData() async {
    cartController.cartProducts.clear();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _clearCartData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: Image.asset('assets/images/successful.PNG'),
                  ),
                  const SizedBox(height: defaultPadding),
                  Text(
                    "Congratulations",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  Text(
                    "Your payment is successful",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) =>
                        //       const CheckoutScreen(),
                        //     ));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor, shape: const StadiumBorder()),
                      child: const Text("Get Your Receipt"),
                    ),
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const MyStatefulWidget(),
                            ),
                            (Route<dynamic> route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: lightOrange,
                          shape: const StadiumBorder()),
                      child: const Text(
                        "Go to Home",
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
