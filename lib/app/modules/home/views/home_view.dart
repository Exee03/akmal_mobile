import 'package:akmal_mobile/app/configs/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../wigets/bottom_appbar.dart';
import '../wigets/empty.dart';
import '../wigets/menu.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(borderRadius),
          ),
        ),
        bottom: const BottomAppbarWidget(),
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 21),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Text(
              'Aplikasi Utama'.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 21),
            child: Obx(
              () => controller.menus.isEmpty
                  ? const EmptyWidget()
                  : const MenuWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
