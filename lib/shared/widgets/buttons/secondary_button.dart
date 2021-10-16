import 'package:flutter/material.dart';
import 'decoration/button_decoration.dart';

class PROSecondaryElevatedButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const PROSecondaryElevatedButton({Key? key, required this.label, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: PROButtonDecoration().elevatedButton(
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
    );
  }
}
