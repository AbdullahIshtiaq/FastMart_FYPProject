import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';

import '../../models/Product.dart';
import 'components/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "My Orders",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(defaultPadding*2,0.0,defaultPadding*2,defaultPadding*2),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                  child: OrderCard(
                    press: () {},
                  ),
                ),
                itemCount: demo_product.length,
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),);
  }
}
