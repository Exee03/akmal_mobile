import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/constant.dart';
import '../controllers/program_controller.dart';

class MonthWidget extends GetView<ProgramController> with PreferredSizeWidget {
  const MonthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 21.0),
          child: Text(
            'Takwim',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        SizedBox(
          height: preferredSize.height - 40,
          width: preferredSize.width,
          child: Obx(() {
            final selected = controller.selectedMonth.value;

            return ListView.builder(
              itemCount: 12,
              scrollDirection: Axis.horizontal,
              controller: controller.scrollController,
              itemBuilder: (context, index) {
                final isSelected = index == selected - 1;

                return Padding(
                  padding: const EdgeInsets.all(8.0).add(EdgeInsets.only(
                    left: index == 0 ? 13 : 0,
                    right: index == 11 ? 13 : 0,
                  )),
                  child: GestureDetector(
                    onTap: () => controller.onMonthChanged(index + 1),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : null,
                        borderRadius: BorderRadius.circular(borderRadius),
                        // border: isSelected ? null : Border.all(color: Colors.white),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        controller.getMonthString(index),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.white,
                            ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
