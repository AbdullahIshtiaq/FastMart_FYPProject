import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/screens/toShopList/toShopList_screen.dart';

import '../../../constants.dart';

class ToShopCard extends StatelessWidget {
  const ToShopCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.bgColor,
  }) : super(key: key);

  final String image, title;
  final VoidCallback press;
  final int price;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(defaultPadding, 0.0, defaultPadding, 0.0),
      decoration: BoxDecoration(
        //color: Colors.white,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: defaultPadding / 2),
                const Text(
                  "Description",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.create,
                  color: primaryColor,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const ToShopListScreen(),
                      ));
                },
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(
                    CupertinoIcons.delete_solid,
                    color: primaryColor,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
