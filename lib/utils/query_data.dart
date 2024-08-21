import 'package:flutter/cupertino.dart';

late MediaQueryData queryData;

double boardSize = queryData.size.width - 8.0 * 2;
double tileSize = (boardSize - 8.0) / 4;
double toggleWidth = queryData.size.width * 0.4;
double toggleHeight = queryData.size.height * 0.08;

double tileSize5 = (boardSize - 8.0) / 5;
double tileSize6 = (boardSize - 8.0) / 6;
double tileSize8 = (boardSize - 8.0) / 8;

double toggleWidthFive = queryData.size.width * 0.35;
double toggleHeightFive = queryData.size.height * 0.08;

// double boardSize = queryData.size.width - 8.0 * 2;
// double tileSize = (boardSize - 8.0) / 5;
// double toggleWidth = queryData.size.width * 0.4;
// double toggleHeight = queryData.size.height * 0.08;
