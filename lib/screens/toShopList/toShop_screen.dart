import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/toShopList/components/dialog_box_content.dart';
import 'package:stylish/screens/toShopList/components/toShop_card.dart';

import '../../models/Product.dart';
import 'components/toShop_input_form.dart';

class ToShopScreen extends StatelessWidget {
  const ToShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Shop",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            defaultPadding * 2, 0.0, defaultPadding * 2, defaultPadding * 2),
        child: Column(
          children: [
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
                  child: ToShopCard(
                    title: demo_product[index].title,
                    image: demo_product[index].image,
                    price: demo_product[index].price,
                    bgColor: demo_product[index].bgColor,
                    press: () {
                    },
                  ),
                ),
                itemCount: demo_product.length,
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            Dialog createListDialog = Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultPadding)), //this right here
              child: Container(
                padding: const EdgeInsets.fromLTRB(defaultPadding,
                    defaultPadding * 2, defaultPadding, defaultPadding * 4),
                child: Wrap(
                  children: [
                    const ToShopInputForm(hint: "List Name"),
                    Center(
                      child: SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              shape: const StadiumBorder()),
                          child: const Text("Create"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
            showDialog(
                context: context,
                builder: (BuildContext context) => createListDialog);

          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
