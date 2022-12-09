import 'package:akmal_mobile/app/configs/constant.dart';
import 'package:akmal_mobile/app/modules/program/widgets/empty.dart';
import 'package:akmal_mobile/app/modules/program/widgets/programs.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/program_controller.dart';
import '../widgets/month.dart';

class ProgramView extends GetView<ProgramController> {
  const ProgramView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(borderRadius),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
        title: TextField(
          onTap: controller.onSearch,
          readOnly: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: "Carian",
            fillColor: Colors.white70,
            prefixIcon: const Icon(Icons.search),
          ),
        ),
        bottom: const MonthWidget(),
      ),
      body: Obx(
        () => controller.programs.isEmpty
            ? const EmptyWidget()
            : const ProgramsWidget(),
      ),
    );
  }
}
