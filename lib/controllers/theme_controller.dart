import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  final _key = 'theme_mode';

  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeMode();
  }

  void _loadThemeMode() {
    final savedTheme = _storage.read(_key);
    if (savedTheme == 'light') {
      themeMode.value = ThemeMode.light;
    } else if (savedTheme == 'dark') {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.system;
    }
    Get.changeThemeMode(themeMode.value);
  }

  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
    String saveValue = 'system';
    if (mode == ThemeMode.light) saveValue = 'light';
    if (mode == ThemeMode.dark) saveValue = 'dark';
    _storage.write(_key, saveValue);
  }
}
