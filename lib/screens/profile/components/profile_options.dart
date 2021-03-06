import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/screens/payment/payment_profile_screen.dart';

import '../../../constants.dart';
import '../../orders/orders_screen.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius:
                const BorderRadius.all(Radius.circular(defaultBorderRadius)),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersScreen(),
                  ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.cube_fill,
                  color: primaryColor,
                ),
                Text(
                  "Orders",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius:
                const BorderRadius.all(Radius.circular(defaultBorderRadius)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.local_offer,
                color: primaryColor,
              ),
              Text(
                "Promotions",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius:
                const BorderRadius.all(Radius.circular(defaultBorderRadius)),
          ),
          child: InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const PaymentProfileScreen(),
                  ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.paypal_rounded,
                  color: primaryColor,
                ),
                Text(
                  "Payment",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
