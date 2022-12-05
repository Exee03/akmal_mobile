import 'package:get/get.dart';

import '../controllers/program_controller.dart';
import '../providers/program_provider.dart';

class ProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramController>(
      () => ProgramController(),
    );
    Get.lazyPut<ProgramProvider>(
      () => ProgramProvider(),
    );
  }
}
