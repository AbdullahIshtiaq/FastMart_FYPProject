import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/application/state/order_state.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/models/MyOrder.dart';
import 'package:stylish/models/MyPagination.dart';
import 'package:stylish/models/OrderFilterModel.dart';
import 'package:stylish/providers/myProvider.dart';
import 'package:stylish/services/shared_service.dart';

import 'dart:developer' as developer;

import 'components/order_card.dart';

class OrdersScreen extends ConsumerWidget {
  OrdersScreen({Key? key, required this.userId}) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _orderList(ref);
  }

  Future<void> _processingData(WidgetRef ref) async {
    OrderFilterModel filterModel = OrderFilterModel(
        paginationModel: MyPaginationModel(page: 1, pageSize: 10),
        userId: userId);
    ref.read(ordersFilterProvider.notifier).setOrderFilter(filterModel);
    ref.read(ordersNotifierProvider.notifier).getOrders();

    developer.log('log me 35: ', name: 'my.app.Order 35');
  }

  Widget _orderList(WidgetRef ref) {
    return FutureBuilder(
      future: _processingData(ref),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        developer.log('log me 42: ', name: 'my.app.Order 42');
        final ordersState = ref.watch(ordersNotifierProvider);

        _scrollController.addListener(() {
          if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
            final orderViewModel = ref.read(ordersNotifierProvider.notifier);
            final orderState = ref.watch(ordersNotifierProvider);

            if (orderState.hasNext) {
              orderViewModel.getOrders();
            }
          }
        });
        //developer.log('log me 48: $productsState', name: 'my.app.Produt');

        developer.log('log me 58: ', name: 'my.app.Order 58');
        if (ordersState.orders.isEmpty) {
          developer.log('log me 60: Empty', name: 'my.app.Order 60');
          // developer.log('log me 52: $productsState', name: 'my.app.Produt 51');
          if (!ordersState.hasNext && !ordersState.isLoading) {
            return const Center(
              child: Text("No Orders"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        }
        //developer.log('log me 63: $productsState', name: 'my.app.Produt 51');
        return _buildOrderList(ordersState.orders, ordersState, context);

        ///Main Screen
      },
    );
  }

  Widget _buildOrderList(
      List<MyOrder> orderList, OrdersState ordersState, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "My Orders",
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
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                  child: OrderCard(
                    order: orderList[index],
                  ),
                ),
                itemCount: orderList.length,
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
