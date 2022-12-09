import 'dart:async';

import 'package:akmal_mobile/app/modules/program/models/program_model.dart';
import 'package:akmal_mobile/app/modules/program/providers/program_provider.dart';
import 'package:akmal_mobile/app/modules/program/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:intl/intl.dart';
import 'package:kt_dart/kt.dart';

class ProgramController extends GetxController {
  //TODO: Implement ProgramController
  final _programProvider = Get.find<ProgramProvider>();
  final _programs = RxList<Program>();
  final selectedMonth = DateTime.now().month.obs;
  StreamSubscription? streamSubscription;
  final searchTerm = "".obs;
  final _isSearch = false.obs;

  final scrollController = ScrollController();

  bool get isSearch => _isSearch.isTrue;
  List<Program> get programs => isSearch && searchTerm.isNotEmpty
      ? _programs
          .where(
            (e) =>
                e.title?.toLowerCase().contains(searchTerm.value) ??
                false || e.description.toLowerCase().contains(searchTerm.value),
          )
          .toList()
      : _programs.value;

  List<DateTime> get monthYearOfPrograms => programs
      .toImmutableList()
      .map((e) => DateTime(e.startDate!.year, e.startDate!.month))
      .distinct()
      .sortedDescending()
      .asList();

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
        _programs.value = data;
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

  Future<void> onSearch() async {
    Get.to(
      () => const SearchView(),
      fullscreenDialog: true,
    );
    _isSearch.value = true;
    getData();
  }

  void onCancelSearch() {
    _isSearch.value = false;
    getData();
    Get.back();
  }

  List<Program> getProgramByMonthYear(DateTime value) {
    return _programs.value
        .where(
          (element) => DateTime(
            element.startDate!.year,
            element.startDate!.month,
          ).isAtSameMomentAs(value),
        )
        .toList();
  }

  String getMontYearByDate(DateTime value) {
    return DateFormat('MMMM y').format(value);
  }
}
