import 'dart:async';
import 'dart:math';

import 'package:akmal_mobile/app/modules/program/models/program_model.dart';
import 'package:akmal_mobile/app/modules/program/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:intl/intl.dart';

class ProgramController extends GetxController {
  //TODO: Implement ProgramController
  final _programProvider = Get.find<ProgramProvider>();
  final _programs = RxList<Program>();
  final selectedMonth = DateTime.now().month.obs;
  StreamSubscription? streamSubscription;
  final searchTerm = "".obs;

  final scrollController = ScrollController();

  bool get isSearch => searchTerm.isNotEmpty;
  List<Program> get programs => isSearch
      ? _programs
          .where(
            (e) =>
                e.title?.toLowerCase().contains(searchTerm.value) ??
                false || e.description.toLowerCase().contains(searchTerm.value),
          )
          .toList()
      : _programs.value;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    getData();

    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        scrollController.animateTo(
          50.0 * selectedMonth.value,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeIn,
        );
      },
    );

    searchTerm.map((data) => data?.isEmpty ?? false).distinct().listen((value) {
      if (value) {
        selectedMonth.value = DateTime.now().month;
      } else {
        selectedMonth.value = 13;
      }
      getData();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    streamSubscription?.cancel();
    scrollController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  void getData() async {
    streamSubscription?.cancel();
    if (isSearch) {
      streamSubscription = _programProvider.getPrograms().listen((data) {
        _programs.value = data.toList();
      });
    } else {
      streamSubscription = _programProvider
          .getProgramsByMonth(selectedMonth.value)
          .listen((data) {
        _programs.value = data;
      });
    }
  }

  String getMonthString(int value) {
    return DateFormat.MMM().format(DateTime(DateTime.now().year, value + 1));
  }

  void onMonthChanged(int value) {
    selectedMonth.value = value;
    getData();
  }

  void onSearchChanged(String value) {
    final debouncer = Debouncer(delay: const Duration(milliseconds: 500));
    debouncer.call(() {
      searchTerm.value = value.toLowerCase();
    });
  }
}
