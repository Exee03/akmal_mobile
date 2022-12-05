import 'dart:async';

import 'package:akmal_mobile/app/modules/program/models/program_model.dart';
import 'package:akmal_mobile/app/modules/program/providers/program_provider.dart';
import 'package:get/get.dart';

class ProgramController extends GetxController {
  //TODO: Implement ProgramController
  final _programProvider = Get.find<ProgramProvider>();
  final programs = RxList<Program>();
  StreamSubscription? streamSubscription;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    streamSubscription?.cancel();
    super.onClose();
  }

  void increment() => count.value++;

  void getData() async {
    streamSubscription?.cancel();
    streamSubscription = _programProvider.getPrograms().listen((data) {
      programs.value = data;
    });
  }
}
