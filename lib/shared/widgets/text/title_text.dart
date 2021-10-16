import 'package:flutter/material.dart';

class PROTitleText extends StatefulWidget {
  final String text;
  final Color color;
  final int? sizeH;
  const PROTitleText({
    Key? key,
    required this.text,
    this.color = Colors.black87, this.sizeH
  }) : super(key: key);

  @override
  _PROTitleTextState createState() => _PROTitleTextState();
}

class _PROTitleTextState extends State<PROTitleText> {
  double getFontSize() {
    switch(widget.sizeH) {
      case 0: return 30;
      case 1: return 24;
      case 2: return 20;
      case 3: return 16;
      default: return 30;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: widget.color,
        fontWeight: FontWeight.bold,
        fontSize: getFontSize(),
      ),
    );
  }
}
