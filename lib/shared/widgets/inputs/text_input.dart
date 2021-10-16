import 'package:flutter/material.dart';
import 'decoration/input_decoration.dart';

class PROTextInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final IconData? icon;
  final String? emptyText;
  final Color? color;
  final Function(String)? onChanged;

  const PROTextInput(
      {Key? key, required this.label, required this.controller, this.icon, this.emptyText, this.color,
        this.onChanged})
      : super(key: key);

  @override
  _PROTextInputState createState() => _PROTextInputState();
}

class _PROTextInputState extends State<PROTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      style: TextStyle(color: widget.color),
      decoration: PROInputDecoration().textInputDecoration(
        label: widget.label,
        icon: widget.icon,
        color: widget.color
      ),
      validator: (text) {
        if(text!.isNotEmpty) {
          return null;
        } else {
          if(widget.emptyText != null) {
            return widget.emptyText;
          }
        }
      },
    );
  }
}
