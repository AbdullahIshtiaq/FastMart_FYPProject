// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyProduct _$$_MyProductFromJson(Map<String, dynamic> json) => _$_MyProduct(
      productName: json['productName'] as String,
      category: MyCategory.fromJson(json['category'] as Map<String, dynamic>),
      productShortDesc: json['productShortDesc'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productSalePrice: (json['productSalePrice'] as num).toDouble(),
      productImg: json['productImg'] as String,
      productSKU: json['productSKU'] as String,
      productType: json['productType'] as String,
      stockStatus: json['stockStatus'] as String,
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$$_MyProductToJson(_$_MyProduct instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'category': instance.category,
      'productShortDesc': instance.productShortDesc,
      'productPrice': instance.productPrice,
      'productSalePrice': instance.productSalePrice,
      'productImg': instance.productImg,
      'productSKU': instance.productSKU,
      'productType': instance.productType,
      'stockStatus': instance.stockStatus,
      'productId': instance.productId,
    };
