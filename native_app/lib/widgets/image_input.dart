import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatefulWidget {
  const InputImage({super.key, required this.onPickedImage});

  final void Function(File image) onPickedImage;

  @override
  State<InputImage> createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  File? _tackenImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _tackenImage = File(pickedImage.path);
    });
    widget.onPickedImage(_tackenImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      icon: const Icon(Icons.camera_alt_outlined),
      label: const Text('Take Picture'),
      onPressed: _takePicture,
    );
    if (_tackenImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _tackenImage!,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
            width: 2,
          ),
        ),
        height: 250,
        width: double.infinity,
        child: content);
  }
}
