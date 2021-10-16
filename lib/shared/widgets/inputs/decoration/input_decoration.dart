import 'package:flutter/material.dart';

class PROInputDecoration {

  textInputDecoration({
    required String label,
    String? hint,
    IconData? icon,
    IconButton? suffixIconButton,
    bool enabled = true,
    Color? color = Colors.black54,
  }) {
    return InputDecoration(
      label: Text(label, style: TextStyle(color: color),),
      focusColor: Colors.amber,
      labelStyle: TextStyle(color: color),
      hintText: hint,
      prefixIcon: Icon(icon, color: color,),
      suffixIcon: suffixIconButton,
      enabled: enabled,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: color != null ? color.withOpacity(0.9) : Colors.grey.shade900
        )
      ),
    );
  }

}