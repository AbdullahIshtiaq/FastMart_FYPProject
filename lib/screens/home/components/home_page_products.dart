import 'package:flutter/material.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/screens/home/components/product_card.dart';

import '../../../constants.dart';
import '../../details/details_screen.dart';

class HomePageProducts extends StatelessWidget {
  const HomePageProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(defaultPadding / 2),
        child: ProductCard(
          title: demo_product[index].title,
          image: demo_product[index].image,
          price: demo_product[index].price,
          bgColor: demo_product[index].bgColor,
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(product: demo_product[index]),
                ));
          },
        ),
      ),
      itemCount: demo_product.length,
      scrollDirection: Axis.vertical,
    );
  }
}
