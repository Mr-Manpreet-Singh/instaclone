import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final imagePicker = ImagePicker();
  final XFile? image = await imagePicker.pickImage(source: source);

  if (image != null) return image.readAsBytes();
}

showSnackBar({required BuildContext context,required String message}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
