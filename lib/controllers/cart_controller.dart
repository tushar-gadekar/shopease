import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/cart_item_model.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  final _storage = GetStorage();
  
  var cartItems = <CartItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadCart();
    
    ever(cartItems, (_) => _saveCart());
  }

  void _loadCart() {
    List<dynamic>? savedCart = _storage.read<List<dynamic>>('cart');
    if (savedCart != null) {
      cartItems.assignAll(savedCart.map((e) => CartItemModel.fromJson(e)).toList());
    }
  }

  void _saveCart() {
    _storage.write('cart', cartItems.map((e) => e.toJson()).toList());
  }

  double get totalAmount {
    double total = 0;
    for (var item in cartItems) {
      total += item.product.price * item.quantity.value;
    }
    return total;
  }
  
  int get itemCount => cartItems.length;

  void addToCart(ProductModel product, {int quantity = 1}) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    
    if (index != -1) {
      cartItems[index].quantity.value += quantity;
    } else {
      cartItems.add(CartItemModel(product: product, quantity: quantity));
    }
    
    Get.snackbar(
      'Added to Cart',
      '${product.name} added successfully',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeFromCart(ProductModel product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
  }

  void increaseQuantity(ProductModel product) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      cartItems[index].quantity.value++;
      cartItems.refresh();
    }
  }

  void decreaseQuantity(ProductModel product) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (cartItems[index].quantity.value > 1) {
        cartItems[index].quantity.value--;
        cartItems.refresh();
      } else {
        removeFromCart(product);
      }
    }
  }

  void clearCart() {
    cartItems.clear();
  }
}
