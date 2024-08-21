// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/query_data.dart';

class Toggle extends StatelessWidget {
  const Toggle({
    Key? key,
    required this.title,
    required this.subTitle,
    this.background = const Color(0xffcdc1b4),
  }) : super(key: key);

  final String title;
  final String subTitle;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: toggleWidth,
      height: toggleHeight,
      child: ListTile(
        isThreeLine: true,
        title: Text(
          title,
          style: TextStyle(fontSize: 15.sp),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(fontSize: 13.sp),
        ),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
