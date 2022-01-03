import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'color.dart';

class Utils{
  static void showToast(
      String message, {
        Color? colorBg,
        Color? colorText,
      }) {
    colorBg ??= ColorResource.grey;
    colorText ??= ColorResource.black;
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: colorBg,
      textColor: colorText,
      timeInSecForIosWeb: 10,
      fontSize: 16.0,
    );
  }
  static Widget getSpaceView(
      double width,
      double height,
      ) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
  static Widget emptyData() {
    return Center(
      child: Text(
        'Không có dữ liệu',
        style: TextStyle(color: ColorResource.colorPrimary, fontSize: 15),
      ),
    );
  }
  static Widget image(){
    return Container(
      color: Colors.grey[300],
      child: Center(
        child: Icon(
          Icons.collections_rounded,
          color: Colors.grey,
          size: 50,
        ),
      ),
    );
  }
}