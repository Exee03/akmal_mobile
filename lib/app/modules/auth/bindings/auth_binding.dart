import 'package:get/get.dart';

import '../../user/providers/user_provider.dart';
import '../controllers/auth_controller.dart';
import '../providers/auth_provider.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<AuthProvider>(
      () => AuthProvider(),
    );
    Get.lazyPut<UserProvider>(
      () => UserProvider(),
    );
  }
}
