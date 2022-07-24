import 'package:flutter/material.dart';
import 'package:stylish/models/Cart.dart';

import '../../../constants.dart';

class OrderItemsList extends StatelessWidget {
  const OrderItemsList({
    Key? key,
    required this.productsList,
  }) : super(key: key);

  final List<CartProduct> productsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      child: SingleChildScrollView(
        child: Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 10,
            ),
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: Title(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${productsList[index].productName} "
                        "(${productsList[index].qty})"),
                    Text("\$${productsList[index].productPrice}"),
                  ],
                ),
              ),
            ),
            itemCount: productsList.length,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
