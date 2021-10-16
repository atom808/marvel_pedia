import 'package:flutter/material.dart';

import 'decoration/button_decoration.dart';

class PROPrimaryElevatedButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const PROPrimaryElevatedButton({Key? key, required this.label, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: PROButtonDecoration().elevatedButton(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
    );
  }
}
