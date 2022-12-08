import 'package:akmal_mobile/app/modules/program/controllers/program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyWidget extends GetView<ProgramController> {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => Text(
          controller.isSearch
              ? 'Tiada program dalam carian'
              : 'Tiada program pada bulan ini',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
