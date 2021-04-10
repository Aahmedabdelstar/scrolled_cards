import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class General {

  static buildTxt(
      {@required String txt,
      color,
      double fontSize,
      bool isOverflow = false,
      double lineHeight = 1,
      bool isBold = false,
      isCenter = true}) {
    return Text(
      txt,
      textAlign: isCenter ? TextAlign.center : null,
      overflow: isOverflow ? TextOverflow.ellipsis : null,
      style: TextStyle(
          color: color,
          height: lineHeight,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }


  static int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

}
