import 'package:flutter/material.dart';
import 'decoration/button_decoration.dart';

class PROTextButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color color;
  const PROTextButton({Key? key, required this.label, this.onPressed, this.color = Colors.black87}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: PROButtonDecoration().textButton(),
      child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold),),
    );
  }
}
