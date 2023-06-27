import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Add Post Comment Page
class AddPostComment extends ConsumerStatefulWidget {
  /// constructor
  const AddPostComment({super.key, this.image});

  /// Post Image
  final Uint8List? image;

  @override
  ConsumerState<AddPostComment> createState() => _AddPostCommentState();
}

class _AddPostCommentState extends ConsumerState<AddPostComment> {
  final TextEditingController commentTextController = TextEditingController();
  final TextEditingController hashtagTextController = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  // final FeedService feedService = FeedService();
  bool isSaving = false;

  int commentTextCount = 0;

  @override
  void initState() {
    super.initState();

    commentTextController.addListener(() {
      // TODO(team): Aufgabe: Zähle die Zeichen des Beitrags und gib diese
      // unterhalb des Textfeldes des Beitrags aus
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beitrag erstellen'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Beschreibung',
                    style: textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // TODO(team): Aufgabe: Beschränke die Eingabe auf maximal 300
                  // Zeichen und gebe die Anzahl der bereits eingegebene Zeichen
                  // unterhalb des Formularfeldes aus.
                  TextFormField(
                    readOnly: isSaving,
                    controller: commentTextController,
                    decoration: InputDecoration(
                      hintText:
                          'Verfasse eine Beschreibung zu Deinem Beitrag...',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    maxLines: 5,
                    validator: (String? text) {
                      if (true == text?.isEmpty) {
                        return 'Du musst einen Beitrag verfassen';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Hashtags',
                    style: textTheme.labelLarge,
                  ),
                  Text(
                    'Optional',
                    style: textTheme.labelSmall,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    readOnly: isSaving,
                    controller: hashtagTextController,
                    decoration: const InputDecoration(
                      hintText: 'Verfasse passende Tags zu Deinem Beitrag...',
                      helperText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    maxLines: 2,
                    validator: (String? text) {
                      // TODO(team): Aufgabe: Prüfe ob alle Tags mit einer Raute
                      // (#) beginnen
                      return null;
                    },
                  ),

                  const Divider(),
                  _navigateBackOrPost(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navigateBackOrPost() {
    return Row(
      children: [
        TextButton(
          onPressed: isSaving
              ? null
              : () {
                  // TODO(team): Aufgabe: Navigiere zurück zur vorherigen Seite.
                  // Schau dazu am besten an welche Funktionen
                  // 'Navigator.of(context)' zur Verfügung stellt.
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
        ElevatedButton(
          onPressed: isSaving
              ? null
              : () {
                  // TODO(team): Validiere die Eingaben und speichere
                  // die Daten im Backend und kehre bei Erfolg auf die FeedPage
                  // zurück. Ist das speichern erfolglos, gebe einen Hinweis aus
                  // und verbleibe auf dieser Seite

                  // TODO(team): Eingaben validieren
                  if (true) {
                    // TODO(team): tags aus dem hastag Textfeld als liste in eine Variable speichern

                    try {
                      // TODO(team): den Post abschicken - schaue dir dazu die
                      // Klasse unter
                      // lib/features/feed/data/feed.repository.impl.dart
                      // an. Diese Klasse kann das. Wenn das Abschicken geklappt
                      // hat, dann kehre zur FeedPage zurück.
                    } catch (e) {
                      // TODO(team): Aufgabe: Erstelle den Fehlerdialog hier
                    }
                  }
                },
          child: const Row(
            children: [
              Icon(Icons.send),
              SizedBox(
                width: 4,
              ),
              Text('Posten'),
            ],
          ),
        ),
      ],
    );
  }
}
