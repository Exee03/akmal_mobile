import 'package:akmal_mobile/generated/locales.g.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static Locale? get fallbackLocale => const Locale('en');

  @override
  Map<String, Map<String, String>> get keys => AppTranslation.translations;
}
