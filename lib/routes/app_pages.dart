import 'package:get/get.dart';
import '../views/auth/login_view.dart';
import '../views/cart/cart_view.dart';
import '../views/details/product_details_view.dart';
import '../views/favorites/favorites_view.dart';
import '../views/home/home_view.dart';
import '../views/splash/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoutes.DETAILS,
      page: () => const ProductDetailsView(),
    ),
    GetPage(
      name: AppRoutes.CART,
      page: () => const CartView(),
    ),
    GetPage(
      name: AppRoutes.FAVORITES,
      page: () => const FavoritesView(),
    ),
  ];
}
