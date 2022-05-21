import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/toShopList/components/dialog_box_content.dart';
import 'package:stylish/screens/toShopList/components/toShopList_product_card.dart';

import '../../models/Product.dart';

class ToShopListScreen extends StatelessWidget {
  const ToShopListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Title",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            defaultPadding * 2, 0.0, defaultPadding * 2, defaultPadding * 2),
        child: Column(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                Dialog createListDialog = Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultPadding)), //this right here
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(defaultPadding,
                        defaultPadding * 2, defaultPadding, defaultPadding * 4),
                    child: const DialogBoxContent(),
                  ),
                );
                showDialog(
                    context: context,
                    builder: (BuildContext context) => createListDialog);

              },
              icon: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Icon(
                  Icons.add_circle_outline,
                  size: 20,
                ),
              ),
              label: const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  "Product",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3,
                ),
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                  child: ToShopListProductCard(
                    title: demo_product[index].title,
                    image: demo_product[index].image,
                    price: demo_product[index].price,
                    bgColor: demo_product[index].bgColor,
                    press: () {},
                  ),
                ),
                itemCount: demo_product.length,
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
