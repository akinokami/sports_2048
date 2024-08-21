import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:sports_2048/language/en_language.dart';
import 'package:sports_2048/language/vi_language.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //'zh_CN': ZhLanguage().zhLanguage,
        'en_US': EnLanguage().enLanguage,
        'vi_VN': ViLanguage().viLanguage,
      };
}
