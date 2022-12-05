import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/program_detail_controller.dart';

class ProgramDetailView extends GetView<ProgramDetailController> {
  const ProgramDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.parallax,
              centerTitle: true,
              title: Obx(
                () => Text(
                  controller.title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
