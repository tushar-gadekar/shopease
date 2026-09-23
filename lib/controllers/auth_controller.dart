import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  final _storage = GetStorage();
  
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    final status = _storage.read<bool>('isLoggedIn');
    if (status != null && status) {
      isLoggedIn.value = true;
    }
  }

  void login(String username, String password) {
    if (username.isNotEmpty && password.isNotEmpty) {
      isLoggedIn.value = true;
      _storage.write('isLoggedIn', true);
      Get.offAllNamed(AppRoutes.HOME);
    } else {
      Get.snackbar('Error', 'Please enter valid credentials', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logout() {
    isLoggedIn.value = false;
    _storage.write('isLoggedIn', false);
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
