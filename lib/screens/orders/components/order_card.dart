import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../order_details_screen.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.press,
  }) : super(key: key);

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        boxShadow: myBoxShadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order No: 1234DGVBG34X",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "04-04-2022",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Quantity: ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "12",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Total: ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "\$5000",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                // Expanded(
                //   child:
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 130,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderDetailsScreen(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: const StadiumBorder()),
                        child: const Text("Details"),
                      ),
                    ),
                  ),
               // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
