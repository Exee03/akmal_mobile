import 'package:akmal_mobile/app/modules/program/controllers/program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../configs/constant.dart';
import '../../../routes/app_pages.dart';

class ProgramsWidget extends GetView<ProgramController> {
  const ProgramsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: controller.programs.length,
      itemBuilder: (context, index) {
        final program = controller.programs[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Card(
            elevation: 0,
            color: HexColor('F1F1F1'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ListTile(
              onTap: () => Get.toNamed(
                Routes.PROGRAM_DETAIL,
                arguments: program,
              ),
              isThreeLine: true,
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      program.dayWeekStart,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: primaryColor,
                          ),
                    ),
                    Text(
                      program.dayStart,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              title: Text(
                program.title ?? '',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(program.description),
            ),
          ),
        );
      },
    );
  }
}
