import 'dart:math';

import 'package:easy_sticky_header/easy_sticky_header.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/program_controller.dart';

class ProgramView extends GetView<ProgramController> {
  const ProgramView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Program AKMAL'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.getData,
            icon: Icon(Icons.abc),
          ),
        ],
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: controller.programs.value.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final program = controller.programs.value[index];
            return ListTile(
              onTap: () => Get.toNamed(
                Routes.PROGRAM_DETAIL,
                arguments: program,
              ),
              title: Text(program.date),
              subtitle: Text(program.title ?? ''),
            );
          },
        ),
      ),
      // body: StickyHeader(
      //   child: ListView.builder(
      //     itemCount: 100,
      //     itemBuilder: (context, index) {
      //       // Custom header widget.
      //       if (index % 3 == 0) {
      //         return StickyContainerWidget(
      //           index: index,
      //           child: Container(
      //             color: Color.fromRGBO(Random().nextInt(256),
      //                 Random().nextInt(256), Random().nextInt(256), 1),
      //             padding: const EdgeInsets.only(left: 16.0),
      //             alignment: Alignment.centerLeft,
      //             width: double.infinity,
      //             height: 50,
      //             child: Text(
      //               'Header #$index',
      //               style: const TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 16,
      //               ),
      //             ),
      //           ),
      //         );
      //       }
      //       // Custom item widget.
      //       return Container(
      //         width: double.infinity,
      //         height: 80,
      //         color: Colors.white,
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
