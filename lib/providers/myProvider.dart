import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/application/notifier/product_filter_notifier.dart';
import 'package:stylish/application/notifier/products_notifier.dart';
import 'package:stylish/application/state/product_state.dart';
import 'package:stylish/models/MyCategory.dart';
import 'package:stylish/models/MyPagination.dart';
import 'package:stylish/services/api_service.dart';

import '../models/MyProduct.dart';
import '../models/ProductFilterModel.dart';

final categoriesProvider =
    FutureProvider.family<List<MyCategory>?, MyPaginationModel>(
  (ref, paginationModel) {
    final apiRepository = ref.watch(apiService);
    return apiRepository.getCategories(
        paginationModel.page, paginationModel.pageSize);
  },
);

final productsProvider =
    FutureProvider.family<List<MyProduct>?, ProductFilterModel>(
  (ref, productFilterModel) {
    final apiRepository = ref.watch(apiService);
    return apiRepository.getProducts(productFilterModel);
  },
);

final productsFilterProvider =
    StateNotifierProvider<ProductFilterNotifier, ProductFilterModel>(
  (ref) => ProductFilterNotifier(),
);

final productsNotifierProvider =
StateNotifierProvider<ProductNotifier, ProductsState>(
      (ref) => ProductNotifier(
        ref.watch(apiService),
        ref.watch(productsFilterProvider)
      ),
);
