import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/product_controller.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/theme_controller.dart';
import '../../routes/app_routes.dart';
import 'widgets/product_card.dart';

class HomeView extends GetView<ProductController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopEase'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              final AuthController auth = Get.find();
              auth.logout();
            },
          ),
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.brightness_6),
            onSelected: (mode) => themeController.setThemeMode(mode),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: ThemeMode.system,
                child: Text('System Default'),
              ),
              const PopupMenuItem(
                value: ThemeMode.light,
                child: Text('Light Mode'),
              ),
              const PopupMenuItem(
                value: ThemeMode.dark,
                child: Text('Dark Mode'),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Get.toNamed(AppRoutes.FAVORITES),
          ),
          Obx(() => IconButton(
                icon: Badge(
                  label: Text('${cartController.itemCount}'),
                  isLabelVisible: cartController.itemCount > 0,
                  child: const Icon(Icons.shopping_cart),
                ),
                onPressed: () => Get.toNamed(AppRoutes.CART),
              )),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: controller.searchProducts,
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Obx(() => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: controller.selectedCategory.value.isEmpty 
                              ? 'All' 
                              : controller.selectedCategory.value,
                          items: controller.categories.map((String category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (val) {
                            if (val != null) controller.filterByCategory(val);
                          },
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Obx(() {
            if (controller.searchQuery.value.isNotEmpty || controller.selectedCategory.value.isNotEmpty) {
              return TextButton.icon(
                onPressed: controller.clearFilters,
                icon: const Icon(Icons.clear),
                label: const Text('Clear Filters'),
              );
            }
            return const SizedBox.shrink();
          }),
          Expanded(
            child: Obx(() {
              if (controller.filteredProducts.isEmpty) {
                return const Center(child: Text('No products found.'));
              }
              return GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: controller.filteredProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: controller.filteredProducts[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
