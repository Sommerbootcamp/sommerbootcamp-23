import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Add Post Image Picker
class AddPostImagePicker extends StatelessWidget {
  /// constructor
  AddPostImagePicker({required this.onImagePicked, super.key});

  /// fires after image picket
  final void Function(Uint8List?) onImagePicked;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Uint8List? image;
    return Row(
      children: [
        const Spacer(),
        ElevatedButton(
          onPressed: () async {
            final file = await _picker.pickImage(source: ImageSource.camera);
            if(null != file){
              onImagePicked(await file.readAsBytes());
            }
            // TODO(team): Öffne die Kamera und mache ein Bild für den
            // Beitrag. Schau dir dazu dein ImagePicker an, der in der Variable
            // '_picker' in Zeile 13 gespeichert wurde. Welche Funktionalität
            // bietet er und wie kannst du ihn einsetzen?
          },
          child: const Row(
            children: [
              Icon(Icons.camera_alt_outlined),
              Text('Kamera'),
            ],
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () async {
            final file = await _picker.pickImage(source: ImageSource.gallery);
            if(null != file){
              onImagePicked(await file.readAsBytes());
            }
            // TODO(team): Aufgabe: Öffne die Bildergalerie um ein Bild für
            // deinen Beitrag auszuwählen. Schau dir dazu dein ImagePicker an,
            // der in der Variable '_picker' in Zeile 13 gespeichert wurde.
            // Welche Funktionalität bietet er und wie kannst du ihn einsetzen?
          },
          child: const Row(
            children: [
              Icon(Icons.image_outlined),
              Text('Gallerie'),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
