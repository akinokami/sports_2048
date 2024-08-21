import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sports_2048/utils/colors.dart';

import '../../controller/splash_controller.dart';
import '../../utils/app_theme.dart';
import '../widgets/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Container(
        color: backgroundColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.webp',
              height: 80.h,
            ),
            SizedBox(height: 30.h),
            CustomText(
              text: '2048',
              size: 14.sp,
            ),
            SizedBox(height: 30.h),
            const CircularProgressIndicator(
              color: Color(0xff8f7a66),
            ),
          ],
        ),
      ),
    );
  }
}
