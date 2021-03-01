
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {

  static BoxDecoration cornerBorder(double borderSize,double radiusSize,Color borderColor) {
    return BoxDecoration(
      border: Border.all(
          color: borderColor,
          width: borderSize
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(radiusSize)
      ),
    );
  }

  static String formatDoubleToCurrency(double value) {
    final formatter = NumberFormat.simpleCurrency(locale: "pt_BR");
    return formatter.format(value);
  }

}
