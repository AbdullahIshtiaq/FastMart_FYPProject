import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stylish/models/MyPagination.dart';

part 'OrderFilterModel.freezed.dart';

@freezed
abstract class OrderFilterModel with _$OrderFilterModel {
  factory OrderFilterModel(
      {required MyPaginationModel paginationModel,
      String? userId}) = _OrderFilterModel;
}
