
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/models/MyPagination.dart';
import 'package:stylish/models/ProductFilterModel.dart';

class ProductFilterNotifier extends StateNotifier<ProductFilterModel>  {

 ProductFilterNotifier() : super(
    ProductFilterModel(paginationModel: MyPaginationModel(
      page: 0,
      pageSize: 10
    ))
  );

  void setProductFilter(ProductFilterModel model){
    state = model;
  }

}

