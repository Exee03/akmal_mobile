import 'package:akmal_mobile/app/modules/program/models/program_model.dart';
import 'package:get/get.dart';

class ProgramDetailController extends GetxController {
  //TODO: Implement ProgramDetailController
  final program = Rx<Program?>(null);

  String get title => program.value?.title ?? 'Program';

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    program.value = Get.arguments;
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
