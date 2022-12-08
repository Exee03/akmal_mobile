import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/app_pages.dart';
import '../../auth/providers/auth_provider.dart';
import '../models/menu.dart';

class HomeController extends GetxController {
  final _menus = [
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

  final _authProvider = Get.find<AuthProvider>();

  final count = 0.obs;
  final _name = "".obs;
  final searchTerm = "".obs;

  bool get isSearch => searchTerm.value.isNotEmpty;
  List<Menu> get menus => isSearch
      ? _menus
          .where(
            (element) => element.title.toLowerCase().contains(searchTerm.value),
          )
          .toList()
      : _menus;

  String get name => _name.value;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getUser() {
    final value = _authProvider.getCurrentUser();
    _name.value =
        value?.phoneNumber ?? value?.displayName ?? value?.email ?? "user";
  }

  void increment() => count.value++;

  void logout() {
    _authProvider.logout();
    Get.offAllNamed(Routes.AUTH);
  }

  Future<void> pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    final path = result?.files.single.path;

    if (path != null) {
      print(path);
      File file = File(path);
    } else {
      // User canceled the picker
    }
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    print(image?.path);
  }

  void onSearchChanged(String value) {
    final debouncer = Debouncer(delay: const Duration(milliseconds: 500));
    debouncer.call(() {
      searchTerm.value = value.toLowerCase();
    });
  }
}
