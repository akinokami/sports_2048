import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

late MediaQueryData queryData;

double boardSize = 1.sw - 8.0 * 2;
double tileSize = (boardSize - 8.0) / 4;
double toggleWidth = 1.sw * 0.4;
double toggleHeight = 1.sh * 0.08;

double tileSize5 = (boardSize - 8.0) / 5;
double tileSize6 = (boardSize - 8.0) / 6;
double tileSize8 = (boardSize - 8.0) / 8;

void reCalculateSize() {
  boardSize = 1.sw - 8.0 * 2;
  tileSize = (boardSize - 8.0) / 4;
  toggleWidth = 1.sw * 0.4;
  toggleHeight = 1.sh * 0.08;

  tileSize5 = (boardSize - 8.0) / 5;
  tileSize6 = (boardSize - 8.0) / 6;
  tileSize8 = (boardSize - 8.0) / 8;
}

// double toggleWidthFive = 1.sw * 0.35;
// double toggleHeightFive = 1.sh * 0.08;


// double boardSize = queryData.size.width - 8.0 * 2;
// double tileSize = (boardSize - 8.0) / 4;
// double toggleWidth = queryData.size.width * 0.4;
// double toggleHeight = queryData.size.height * 0.08;

// double tileSize5 = (boardSize - 8.0) / 5;
// double tileSize6 = (boardSize - 8.0) / 6;
// double tileSize8 = (boardSize - 8.0) / 8;

// double toggleWidthFive = queryData.size.width * 0.35;
// double toggleHeightFive = queryData.size.height * 0.08;