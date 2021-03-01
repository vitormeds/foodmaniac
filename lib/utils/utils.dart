
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {

  static BoxDecoration cornerBorder(double borderSize,double radiusSize,Color borderColor) {
    return BoxDecoration(
      border: Border.all(
          color: borderColor,
          width: borderSize
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(radiusSize) //                 <--- border radius here
      ),
    );
  }
}
