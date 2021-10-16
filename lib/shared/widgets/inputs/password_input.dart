import 'package:flutter/material.dart';

import 'decoration/input_decoration.dart';

class PROPasswordInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const PROPasswordInput({Key? key, required this.label, required this.controller}) : super(key: key);

  @override
  _PROPasswordInputState createState() => _PROPasswordInputState();
}

class _PROPasswordInputState extends State<PROPasswordInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: PROInputDecoration().textInputDecoration(
        label: widget.label,
        icon: Icons.lock,
        // suffixIconButton: IconButton(
        //   icon: Icon(Icons.remove_red_eye),
        //   onPressed: () {},
        // )
      ),
      obscureText: true,
      validator: (text) {
        if(text!.isNotEmpty) {
          return null;
        } else {
          return 'Campo obrigatório';
        }
      },
    );
  }
}
