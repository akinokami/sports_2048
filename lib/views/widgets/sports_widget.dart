import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SportsWidget extends StatelessWidget {
  const SportsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.sports_soccer,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
            Icon(
              Icons.sports_football,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
            Icon(
              Icons.sports_volleyball,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.sports_baseball,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
            Icon(
              Icons.sports_golf,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.sports_baseball,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
            Icon(
              Icons.sports_mma,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
            Icon(
              Icons.sports_tennis,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.sports_rugby,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
            Icon(
              Icons.sports_hockey,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.sports_basketball,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
            Icon(
              Icons.sports_golf,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
            Icon(
              Icons.sports_baseball,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.sports_soccer,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
            Icon(
              Icons.sports_football,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.sports_tennis,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
            Icon(
              Icons.sports_rugby,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
            Icon(
              Icons.sports_mma,
              color: Colors.grey.shade300,
              size: 80.sp,
            ),
          ],
        ),
      ],
    );
  }
}
