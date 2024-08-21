import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sports_2048/services/local_storage.dart';
import 'package:sports_2048/utils/colors.dart';
import 'package:sports_2048/utils/constants.dart';
import 'package:sports_2048/views/screens/game/eight_eight/eight_eight_screen.dart';
import 'package:sports_2048/views/screens/game/five_five/five_five_screen.dart';
import 'package:sports_2048/views/screens/game/game_screen.dart';
import 'package:sports_2048/views/screens/game/six_six/six_six_screen.dart';
import 'package:sports_2048/views/screens/setting/setting_screen.dart';
import 'package:sports_2048/views/widgets/custom_game_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../controller/sound_controller.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/global.dart';
import '../../widgets/custom_text.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  bool isAccepted = false;
  bool isChecked = false;
  String f = '';
  int selectedGame = 4;

  @override
  void initState() {
    super.initState();

    f = LocalStorage.instance.read(first) ?? '';

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        if (f == '') {
          if (context.mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => Builder(builder: (context) {
                return StatefulBuilder(
                  builder: (context, StateSetter setState) {
                    return AlertDialog(
                      content: SizedBox(
                        height: 1.sh * 0.80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SingleChildScrollView(
                              child: SizedBox(
                                  height: 1.sh * 0.65,
                                  width: double.infinity,
                                  child: WebViewWidget(
                                      controller: WebViewController()
                                        ..loadHtmlString(Global.language == "vi"
                                            ? Global.policyHtmlVi
                                            : Global.policyHtmlEn))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  activeColor: AppTheme.green,
                                  side: BorderSide(
                                    width: 1.5,
                                    color: isChecked
                                        ? AppTheme.green
                                        : Colors.black,
                                  ),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                      if (isChecked) {
                                        isAccepted = true;
                                      } else {
                                        isAccepted = false;
                                      }
                                    });
                                  },
                                ),
                                CustomText(
                                  text: 'agree'.tr,
                                  size: 12,
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          isAccepted
                                              ? AppTheme.green
                                              : AppTheme.greyTicket)),
                              // ignore: sort_child_properties_last
                              child: CustomText(
                                text: 'accept'.tr,
                                size: 12,
                              ),
                              onPressed: isAccepted
                                  ? () async {
                                      LocalStorage.instance
                                          .write(first, 'notfirst');
                                      Navigator.pop(context);
                                    }
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            );
          }
        }
      } catch (e) {
        // print("Error fetching SharedPreferences: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final soundController = Get.put(SoundController());
    soundController.playSound();

    return Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomGameButton(
                      onTap: () {
                        exit(0);
                      },
                      height: 35.w,
                      width: 35.w,
                      icon: Icons.close,
                      iconColor: AppTheme.white,
                      color1: Colors.red,
                      color2: Colors.red.shade300,
                      color3: Colors.red,
                    ),
                    CustomGameButton(
                      onTap: () {
                        Get.to(() => const SettingScreen());
                      },
                      height: 35.w,
                      width: 35.w,
                      icon: Icons.settings,
                      iconColor: AppTheme.white,
                    ),
                  ],
                ),
                SizedBox(height: 120.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedGame = 4;
                        });
                      },
                      child: Column(
                        children: [
                          selectedGame == 4
                              ? Image.asset(
                                  'assets/images/four.webp',
                                  height: 100.h,
                                )
                              : ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Colors.grey.withOpacity(
                                        0.5), // Adjust the opacity to control brightness
                                    BlendMode.darken, // This darkens the image
                                  ),
                                  child: Image.asset(
                                    'assets/images/four.webp',
                                    height: 100.h,
                                  ),
                                ),
                          SizedBox(height: 10.h),
                          CustomText(
                            text: '4 x 4',
                            size: 16.sp,
                            fontWeight: FontWeight.w500,
                            textColor:
                                selectedGame == 4 ? Colors.black : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedGame = 5;
                        });
                      },
                      child: Column(
                        children: [
                          selectedGame == 5
                              ? Image.asset(
                                  'assets/images/five.webp',
                                  height: 100.h,
                                )
                              : ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Colors.grey.withOpacity(
                                        0.5), // Adjust the opacity to control brightness
                                    BlendMode.darken, // This darkens the image
                                  ),
                                  child: Image.asset(
                                    'assets/images/five.webp',
                                    height: 100.h,
                                  ),
                                ),
                          SizedBox(height: 10.h),
                          CustomText(
                            text: '5 x 5',
                            size: 16.sp,
                            fontWeight: FontWeight.w500,
                            textColor:
                                selectedGame == 5 ? Colors.black : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedGame = 6;
                        });
                      },
                      child: Column(
                        children: [
                          selectedGame == 6
                              ? Image.asset(
                                  'assets/images/six.webp',
                                  height: 100.h,
                                )
                              : ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Colors.grey.withOpacity(
                                        0.5), // Adjust the opacity to control brightness
                                    BlendMode.darken, // This darkens the image
                                  ),
                                  child: Image.asset(
                                    'assets/images/six.webp',
                                    height: 100.h,
                                  ),
                                ),
                          SizedBox(height: 10.h),
                          CustomText(
                            text: '6 x 6',
                            size: 16.sp,
                            fontWeight: FontWeight.w500,
                            textColor:
                                selectedGame == 6 ? Colors.black : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedGame = 8;
                        });
                      },
                      child: Column(
                        children: [
                          selectedGame == 8
                              ? Image.asset(
                                  'assets/images/eight.webp',
                                  height: 100.h,
                                )
                              : ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Colors.grey.withOpacity(
                                        0.5), // Adjust the opacity to control brightness
                                    BlendMode.darken, // This darkens the image
                                  ),
                                  child: Image.asset(
                                    'assets/images/eight.webp',
                                    height: 100.h,
                                  ),
                                ),
                          SizedBox(height: 10.h),
                          CustomText(
                            text: '8 x 8',
                            size: 16.sp,
                            fontWeight: FontWeight.w500,
                            textColor:
                                selectedGame == 8 ? Colors.black : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                CustomGameButton(
                  onTap: () {
                    if (selectedGame == 4) {
                      Get.to(() => const GameScreen());
                    } else if (selectedGame == 5) {
                      Get.to(() => const FiveFiveScreen());
                    } else if (selectedGame == 6) {
                      Get.to(() => const SixSixScreen());
                    } else {
                      Get.to(() => const EigntEightScreen());
                    }
                  },
                  width: 0.2.sh,
                  text: 'play'.tr,
                  textColor: AppTheme.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
