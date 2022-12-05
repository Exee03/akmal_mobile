import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../models/menu.dart';

class HomeController extends GetxController {
  final menus = [
    Menu(
      title: 'Takwim',
      icon: Icons.calendar_month,
      onPressed: () {
        Get.toNamed(Routes.PROGRAM);
      },
    ),
    Menu(
      title: 'AKMAL2U',
      icon: Icons.school,
      onPressed: () {
        print('go to AKMAL2U');
      },
    ),
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
