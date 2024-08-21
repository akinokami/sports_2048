import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:sports_2048/controller/sound_controller.dart';
import 'package:sports_2048/utils/colors.dart';
import 'package:sports_2048/views/screens/setting/change_language.dart';
import 'package:sports_2048/views/widgets/custom_game_button.dart';
import '../../../controller/language_controller.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/constants.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';
import 'privacy_policy_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  / final settingController = Get.put(SettingController());
    final languageController = Get.put(LanguageController());
    final soundController = Get.put(SoundController());
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: AppTheme.white,
        //   iconTheme: const IconThemeData(color: AppTheme.black),
        //   centerTitle: true,
        //   title: CustomText(
        //     text: 'settings'.tr,
        //     size: 15.sp,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        body: SafeArea(
      child: Container(
        color: backgroundColor,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(
        //       "assets/images/bg.webp",
        //     ),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Row(
                  children: [
                    CustomGameButton(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      height: 35.w,
                      width: 35.w,
                      icon: Icons.arrow_back,
                      iconColor: AppTheme.white,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomText(
                      text: 'settings'.tr,
                      size: 15.sp,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              CustomText(text: 'general'.tr),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ChangeLanguageScreen());
                },
                child: CustomCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.language,
                            size: 18.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomText(text: 'language'.tr)
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: languageController.lang.value ==
                                    Language.en.name
                                ? 'english'.tr
                                : languageController.lang.value ==
                                        Language.vi.name
                                    ? 'vietnam'.tr
                                    : 'chinese'.tr,
                            size: 12.sp,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => CustomCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.music_note,
                            size: 18.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomText(text: 'sound'.tr)
                        ],
                      ),
                      FlutterSwitch(
                        padding: 1.5,
                        height: 23,
                        width: 44,
                        inactiveColor: Colors.grey,
                        activeColor: Colors.green,
                        value: soundController.isMuted.value,
                        onToggle: (val) {
                          soundController.isMuted.value = val;
                          soundController.muteUnmute();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(text: 'other'.tr),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => const PrivacyPolicyScreen());
                },
                child: CustomCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.policy_outlined,
                            size: 18.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomText(text: 'policy'.tr)
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18.sp,
                      ),
                    ],
                  ),
                ),
              ),
              CustomCard(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 18.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(text: 'version'.tr),
                      ],
                    ),
                    const CustomText(text: '1.0.0'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
