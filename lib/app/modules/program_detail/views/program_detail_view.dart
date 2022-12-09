import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/constant.dart';
import '../controllers/program_detail_controller.dart';
import '../widgets/tile_widget.dart';

class ProgramDetailView extends GetView<ProgramDetailController> {
  const ProgramDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: FloatingActionButton.extended(
          onPressed: controller.addCalendar,
          backgroundColor: Theme.of(context).colorScheme.primary,
          label: Text('add_to_calendar'.tr),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
        children: [
          TileWidget(
            label: 'program_name'.tr,
            value: controller.title,
          ),
          if (controller.isSameDay) ...[
            TileWidget(
              label: 'Tarikh Mula',
              value: controller.dateStart,
            ),
          ] else ...[
            TileWidget(
              label: 'Tarikh',
              value: controller.date,
            ),
          ],
          TileWidget(
            label: 'Waktu',
            value: controller.time,
          ),
          TileWidget(
            label: 'Tempat',
            value: controller.location,
          ),
          ListTile(
            title: Text(
              'Pegawai Terlibat',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            isThreeLine: true,
            subtitle: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: controller.coordinators.length,
              itemBuilder: (context, index) {
                final coordinator = controller.coordinators[index];

                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  // dense: true,
                  title: Text(coordinator),
                  subtitle: Text('Pangkat bagi $coordinator'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
