import 'package:flutter/material.dart';


class PROButtonDecoration {

  elevatedButton ({
    required Color color,
    Brightness brightness = Brightness.light
  }) {
    return ElevatedButton.styleFrom(
      primary: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      maximumSize: Size.fromWidth(400),
    );
  }


  textButton ({Brightness brightness = Brightness.light}) {
    return TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
      maximumSize: Size.fromWidth(400),
      primary: Colors.orange
    );
  }
}