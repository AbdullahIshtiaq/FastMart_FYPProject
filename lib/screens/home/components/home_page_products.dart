import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/models/ProductFilterModel.dart';
import 'package:stylish/screens/home/components/product_card.dart';

import '../../../constants.dart';
import '../../../models/MyPagination.dart';
import '../../../models/MyProduct.dart';
import '../../../providers/myProvider.dart';
import '../../details/details_screen.dart';
import 'dart:developer' as developer;

class HomePageProducts extends ConsumerWidget {
  const HomePageProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _productList(ref);
  }

  Widget _productList(WidgetRef ref) {
    final products = ref.watch(
      productsProvider(
        ProductFilterModel(
          paginationModel:  MyPaginationModel(page: 1, pageSize: 10),
        )
      ),
    );

    developer.log('log me 35:  ${products}', name: 'my.app.product');

    return products.when(
        data: (list) {
          return _buildProductList(list!);
        },
        error: (_, __) => const Center(
          child: Text("Error"),
        ),
        loading: () => const Center(child: CircularProgressIndicator()));
  }

  Widget _buildProductList(List<MyProduct> productList ){
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(defaultPadding / 2),
        child: ProductCard(
          title: productList[index].productName,
          image: productList[index].fullImagePath,
          price:productList[index].productPrice.toInt(),
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
      itemCount: productList.length,
      scrollDirection: Axis.vertical,
    );
  }
}
