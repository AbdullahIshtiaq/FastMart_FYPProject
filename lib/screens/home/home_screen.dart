import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/models/MyProduct.dart';
import 'package:stylish/screens/cart/cart_screen.dart';
import 'package:stylish/screens/notifications/notification_screen.dart';

import '../../models/MyCategory.dart';
import '../../models/MyPagination.dart';
import '../../models/ProductFilterModel.dart';
import '../../providers/myProvider.dart';
import 'components/categories.dart';
import 'components/home_page_products.dart';
import 'components/search_filter_form.dart';
import 'components/search_form.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({Key? key}) : super(key: key);

  @override


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "FastMart",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell_fill,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ));
            },
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.cart_fill,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ));
            },
          ),
        ],
      ),
      body:
      // SingleChildScrollView(
      //   physics: const BouncingScrollPhysics(
      //       parent: AlwaysScrollableScrollPhysics()),
      //   scrollDirection: Axis.vertical,
      //   child:
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
              ),
              const Text(
                "best Products for you",
                style: TextStyle(fontSize: 15),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding / 1.5),
                child: SearchForm(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const Categories(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Products",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(child: HomePageProducts()),
            ],
          ),
        ),
    // ),
      endDrawer: const SearchFilter(),
    );
  }
}
