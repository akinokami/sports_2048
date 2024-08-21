import 'package:get/get.dart';
import 'package:sports_2048/views/screens/game/play_screen.dart';
import '../services/api_utils.dart';

class SplashController extends GetxController {
  final ApiUtils apiUtils = ApiUtils();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => const PlayScreen());
    });
  }

  @override
  void onClose() {
    //
    super.onClose();
  }
}
