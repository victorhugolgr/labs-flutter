import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final Function onChanged;
  final String Function() errorText;
  final IconData icon;
  final TextEditingController controller;

  const TextFieldWidget({
    this.labelText,
    this.onChanged,
    this.errorText,
    this.icon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        prefixIcon: Icon(icon),
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }
}
