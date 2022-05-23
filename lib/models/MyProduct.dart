import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../config.dart';
import 'MyCategory.dart';

part 'MyProduct.freezed.dart';

part 'MyProduct.g.dart';

List<MyProduct> productFromJson(dynamic str) =>
    List<MyProduct>.from((str).map((e) => MyProduct.fromJson(e)));

@freezed
abstract class MyProduct with _$MyProduct{
  factory MyProduct(
      {required String productName,
        required MyCategory category,
        required String productShortDesc,
        required double productPrice,
        required double productSalePrice,
        required String productImg,
        required String productSKU,
        required String productType,
        required String stockStatus,
        required String productId,
      }) = _MyProduct;

  factory MyProduct.fromJson(Map<String, dynamic> json) =>
      _$MyProductFromJson(json);
}

extension ProductExt on MyProduct{
  String get fullImagePath => Config.imgURL+productImg;
}