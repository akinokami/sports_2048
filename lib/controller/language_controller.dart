import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_2048/services/local_storage.dart';
import 'package:sports_2048/utils/constants.dart';

class LanguageController extends GetxController {
  final lang = ''.obs;

  @override
  void onInit() {
    getLanguage();
    super.onInit();
  }

  void changeLanguage(String languageCode, String countryCode) {
    lang.value = languageCode;

    Get.updateLocale(Locale(languageCode, countryCode));
    LocalStorage.instance.write(language, languageCode);
  }

  void getLanguage() {
    lang.value = LocalStorage.instance.read(language) ?? Language.vi.name;
  }
}
