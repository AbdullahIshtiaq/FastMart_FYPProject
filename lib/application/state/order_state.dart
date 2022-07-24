import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stylish/models/MyOrder.dart';

part 'order_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  factory OrdersState(
      {@Default(<MyOrder>[]) List<MyOrder> orders,
      @Default(true) bool hasNext,
      @Default(false) bool isLoading}) = _OrdersState;
}
