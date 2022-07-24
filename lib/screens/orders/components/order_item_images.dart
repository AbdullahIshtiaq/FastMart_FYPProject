import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/config.dart';
import 'package:stylish/models/Category.dart';
import 'package:stylish/models/MyProduct.dart';

import '../../../constants.dart';

class OrderItemImages extends StatelessWidget {
  const OrderItemImages({Key? key, required this.productsList})
      : super(key: key);

  final List<MyProduct> productsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: productsList.length,
        itemBuilder: (context, index) => ProductImgCard(
          icon: productsList[index].productImg,
          title: productsList[index].productName,
          press: () {},
        ),
        separatorBuilder: (context, index) =>
            const SizedBox(width: defaultPadding),
      ),
    );
  }
}

class ProductImgCard extends StatelessWidget {
  const ProductImgCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                Config.imgURL + icon,
                height: 50,
                width: 50,
              ),
            ),
            // SvgPicture.asset(icon),
            const SizedBox(height: defaultPadding / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
