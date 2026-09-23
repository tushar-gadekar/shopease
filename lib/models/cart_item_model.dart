import 'package:get/get.dart';
import 'product_model.dart';

class CartItemModel {
  final ProductModel product;
  RxInt quantity;

  CartItemModel({
    required this.product,
    int quantity = 1,
  }) : quantity = quantity.obs;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      product: ProductModel.fromJson(json['product']),
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity.value,
    };
  }
}
