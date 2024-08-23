import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sports_2048/utils/colors.dart';
import 'package:sports_2048/utils/constants.dart';
import 'package:sports_2048/views/widgets/sports_widget.dart';

import '../../../controller/language_controller.dart';
import '../../../utils/app_theme.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_game_button.dart';
import '../../widgets/custom_text.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //   backgroundColor: AppTheme.white,
      //   iconTheme: const IconThemeData(color: AppTheme.black),
      //   title: CustomText(
      //     text: 'change_language'.tr,
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
          child: Stack(
            children: [
              const SportsWidget(),
              Column(
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
                          text: 'change_language'.tr,
                          size: 15.sp,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              languageController.changeLanguage("en", "US");
                            },
                            child: CustomCard(
                              widget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/usa.webp",
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      const CustomText(
                                        text: "English",
                                      )
                                    ],
                                  ),
                                  Icon(
                                    languageController.lang.value ==
                                            Language.en.name
                                        ? Icons.check_circle
                                        : Icons.check_circle_outline,
                                    color: languageController.lang.value ==
                                            Language.en.name
                                        ? AppTheme.green
                                        : AppTheme.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Obx(
                        //   () => GestureDetector(
                        //     onTap: () {
                        //       languageController.changeLanguage("zh", "CN");
                        //     },
                        //     child: Card(
                        //       color: cardColor,
                        //       child: ListTile(
                        //         leading: Image.asset(
                        //           "assets/images/china.webp",
                        //           width: 20.w,
                        //           height: 20.h,
                        //         ),
                        //         title: CustomText(
                        //           text: "中国人",
                        //           //color: lightWhiteColor,
                        //         ),
                        //         trailing: Icon(
                        //           languageController.language.value == "zh"
                        //               ? Icons.check_circle
                        //               : Icons.check_circle_outline,
                        //           color: languageController.language.value == "zh"
                        //               ? secondaryColor
                        //               : greyColor,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              languageController.changeLanguage("vi", "VN");
                            },
                            child: CustomCard(
                              widget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/vietnam.webp",
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      const CustomText(
                                        text: "Tiếng Việt",
                                      )
                                    ],
                                  ),
                                  Icon(
                                    languageController.lang.value ==
                                            Language.vi.name
                                        ? Icons.check_circle
                                        : Icons.check_circle_outline,
                                    color: languageController.lang.value ==
                                            Language.vi.name
                                        ? AppTheme.green
                                        : AppTheme.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
