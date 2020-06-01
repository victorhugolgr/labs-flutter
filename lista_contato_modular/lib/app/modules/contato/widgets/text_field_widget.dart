import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final Function onChanged;
  final String Function(String) validator;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String initialValue;

  const TextFieldWidget({
    this.labelText,
    this.onChanged,
    this.validator,
    this.icon,
    this.controller,
    this.textInputType = TextInputType.text,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: textInputType,
      initialValue: initialValue,
      onSaved: (value)=> debugPrint(value),
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
