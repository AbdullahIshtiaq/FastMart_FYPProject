import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/models/MyCategory.dart';
import 'package:stylish/models/MyPagination.dart';
import 'package:stylish/services/api_service.dart';
import '../models/MyProduct.dart';

import 'dart:developer' as developer;

import '../models/ProductFilterModel.dart';

final categoriesProvider = FutureProvider.family<List<MyCategory>?, MyPaginationModel>(
    (ref, paginationModel){
      final apiRepository = ref.watch(apiService);
      return apiRepository.getCategories(paginationModel.page, paginationModel.pageSize);
    },
);

final productsProvider = FutureProvider.family<List<MyProduct>?, ProductFilterModel>(
      (ref, productFilterModel){
    final apiRepository = ref.watch(apiService);
    return apiRepository.getProducts(productFilterModel);
  },
);