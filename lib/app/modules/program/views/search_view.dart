import 'package:akmal_mobile/app/modules/program/controllers/program_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../configs/constant.dart';
import '../widgets/empty.dart';
import '../widgets/programs_search.dart';

class SearchView extends GetView<ProgramController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: AppBar().preferredSize.height + 30,
        title: TextField(
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
              suffixIcon: IconButton(
                onPressed: controller.onCancelSearch,
                icon: const Icon(
                  Icons.close,
                ),
              )),
          onChanged: controller.onSearchChanged,
        ),
      ),
      body: Obx(
        () => controller.programs.isEmpty
            ? const EmptyWidget()
            : const ProgramsSearchWidget(),
      ),
    );
  }
}
