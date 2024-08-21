import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sports_2048/language/languages.dart';
import 'package:sports_2048/services/local_storage.dart';
import 'package:sports_2048/utils/constants.dart';
import 'package:sports_2048/views/screens/splash_screen.dart';
import 'utils/global.dart';

void main() async {
  await LocalStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Global.language = LocalStorage.instance.read(language) ?? Language.vi.name;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'picture_match'.tr,
          theme: ThemeData(primarySwatch: Colors.brown),
          // theme: CustomTheme.lightTheme,
          // darkTheme: CustomTheme.darkTheme,
          // themeMode: ThemeMode.system,
          translations: Languages(),
          locale: Global.language == Language.vi.name
              ? const Locale('vi', 'VN')
              : const Locale('en', 'US'),
          fallbackLocale: const Locale('vi', 'VN'),
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
