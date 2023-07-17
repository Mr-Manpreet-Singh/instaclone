import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hintText;
  final bool isPass;
  const TextInput({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.textEditingController,
    this.isPass = false,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: isPass,
      decoration: InputDecoration(
        filled: true,
        enabledBorder: inputBorder,
        errorBorder: inputBorder,
        border: inputBorder,
        contentPadding: const EdgeInsets.all(8),
        hintText: hintText,
      ),
    );
  }
}
