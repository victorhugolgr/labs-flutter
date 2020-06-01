import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final Function onChanged;
  final String Function(String) validator;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String initialValue;
  final Function(String) onSaved;

  const TextFieldWidget({
    this.labelText,
    this.onChanged,
    this.validator,
    this.icon,
    this.controller,
    this.textInputType = TextInputType.text,
    this.initialValue,
    this.onSaved
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: TextEditingController(text: initialValue),
      keyboardType: textInputType,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
