import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'add_post_image_picker.dart';

/// Add an new Post Widget
class AddPost extends StatefulWidget {
  /// constructor
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;
  Uint8List? image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beitrag erstellen'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * .6,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: theme.colorScheme.primaryContainer,
                      ),
                    ),
                    child: (null != image)
                        ? Image.memory(image!, fit: BoxFit.contain)
                        : const Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_box_outlined),
                              Text('Wähle ein Bild für deinen Beitrag aus.'),
                            ],
                          ),
                  ),
                ),
                const Spacer(),
                if (null == image) _noImageNavigation(),
                if (null != image) _removeImageOrNextNavigation(),
                const SizedBox(
                  height: 16,
                ),
                if (null == image)
                  AddPostImagePicker(
                    onImagePicked: (Uint8List? selectedImage) {
                      // TODO(team): Zeige das ausgewählte Bild an

                      // Antwort A
                      // image = null
                      // setState(() {
                      //   true;
                      // })

                      // Antwort B
                      // setState(() {
                      //   image = null;
                      // });

                      // Antwort C
                      // setState(() {
                      //   image = selectedImage;
                      // });
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _noImageNavigation() {
    return Row(
      children: [
        const Spacer(),
        TextButton(
          onPressed: () {
            // TODO(team): Aufgabe: Navigiere zur letzten Seite zurück. Schau
            // dazu am besten an welche Funktionen 'Navigator.of(context)' zur
            // Verfügung stellt.
          },
          child: const Row(
            children: [
              Icon(Icons.arrow_circle_left_outlined),
              SizedBox(
                width: 4,
              ),
              Text('Zurück'),
            ],
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            // TODO(team): Navigiere zur nächsten Seite um den Beitrag
            // ohne ein Bild zu verfassen

            // Antwort A
            // GoRouter.of(context).push('/login');

            // Antwort B
            // GoRouter.of(context).push('/add-comment/to/feed');

            // Antwort C
            // GoRouter.of(context).push('/feed/add/comment');

            // Antwort D
            // GoRouter.of(context).push(FeedRoutes().routes.first.path);
          },
          child: const Row(
            children: [
              Icon(Icons.arrow_circle_right_outlined),
              SizedBox(
                width: 4,
              ),
              Text('Weiter ohne Bild'),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _removeImageOrNextNavigation() {
    return Row(
      children: [
        const Spacer(),
        TextButton(
          onPressed: () {
            // TODO(team): Lösche das ausgewählte Image, der Nutzer
            // muss wieder in der Lage sein ein Image auszuwählen oder mit der
            // Kamera aufzunehmen

            // Antwort A
            // image = null
            // setState(() {
            //   true;
            // })

            // Antwort B
            // setState(() {
            //   image = null;
            // });

            // Antwort C
            // setState(() {
            //   image = selectedImage;
            // });
          },
          child: const Row(
            children: [
              Icon(Icons.delete_outline),
              SizedBox(
                width: 4,
              ),
              Text('Löschen'),
            ],
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            // TODO(team): navigiere zur nächsten Seite, die nächste
            // Seite benötigt das Image, wenn eins ausgewählt wurde

            // Antwort A
            // GoRouter.of(context).push(
            //   '/feed/add/comment',
            //   extra: image,
            // );

            // Antwort B
            // GoRouter.of(context).push(
            //   '/feed/add/comment',
            //   extra: null,
            // );

            // Antwort C
            // GoRouter.of(context).push(
            //   '/feed/add/comment',
            // );
          },
          child: const Row(
            children: [
              Icon(Icons.arrow_circle_right_outlined),
              SizedBox(
                width: 4,
              ),
              Text('Weiter'),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
