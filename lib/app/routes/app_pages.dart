import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/program/bindings/program_binding.dart';
import '../modules/program/views/program_view.dart';
import '../modules/program_detail/bindings/program_detail_binding.dart';
import '../modules/program_detail/views/program_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROGRAM,
      page: () => const ProgramView(),
      binding: ProgramBinding(),
    ),
    GetPage(
      name: _Paths.PROGRAM_DETAIL,
      page: () => const ProgramDetailView(),
      binding: ProgramDetailBinding(),
    ),
  ];
}
