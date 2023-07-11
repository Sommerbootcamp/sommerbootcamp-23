
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../shared/feed.providers.dart';


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

  Widget buildAlertDialog(BuildContext context) {
    const title = 'Posten fehlgeschlagen';
    const content = 'geh zurück, keiner mag dich';
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: const Text(title),
        content: const Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    }

    return AlertDialog(
      title: const Text(title),
      content: const Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
  // final FeedService feedService = FeedService();
  bool isSaving = false;
  bool h = true;
  int commentTextCount = 0;

  get readOnly => null;

  @override
  void initState() {
    super.initState();

    commentTextController.addListener(() {
  int chars = commentTextController.text.length;
      //  = fertig
    setState(() {
       commentTextController.text.length;
    });
    });
  }

  int maxLength = 300;
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


                  //  = fertig
                  // Zeichen und gebe die Anzahl der bereits eingegebene Zeichen
                  // unterhalb des Formularfeldes aus.
                  TextFormField(

                    inputFormatters: [
                      LengthLimitingTextInputFormatter(maxLength)
                    ],
                      keyboardType: TextInputType.text,

                      /*
                      onChanged: (String newVal) {
                       if(maxLength >= commentTextController.text.length){
                         commentTextController.text = newVal.substring(0, maxLength);
                       }
                      },
                      */
                    validator: (String? text) {
                      if (true == text?.isEmpty) {
                        return 'Du musst einen Beitrag verfassen';
                      }
                      return null;
                    },


                    readOnly: isSaving,
                    controller: commentTextController,
                    decoration: InputDecoration(
                      counter: Text('${commentTextController.text.length} / 300'),
                      hintText:
                          'Verfasse eine Beschreibung zu Deinem Beitrag...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    maxLines: 5,

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
                      if(null == text) {
                        return null;
                      }
                      final tags = text.split(' ');
                      //  = fertig
                      // (#) beginnen
                      for (var item in tags){
                        if(!item.startsWith('#')){
                          return 'ungültiger hashtag';// if true
                        }
                      }

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
            Navigator.pop(context);

            //  = fertig
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
              : () async {

                  // TODO(team): Validiere die Eingaben und speichere
                  // die Daten im Backend und kehre bei Erfolg auf die FeedPage
                  // zurück. Ist das speichern erfolglos, gebe einen Hinweis aus
                  // und verbleibe auf dieser Seite

                  // fertig: Eingaben in untenstehenden if-Bedingung
                  // validieren
                  if (formState.currentState!.validate()) {
                    final String tagsString = hashtagTextController.text;

                    List<String> list = tagsString.split(' ');
                    // TODO(team): Tags aus dem Hastag Textfeld als Liste in
                    // eine Variable speichern. Recherchiere was die
                    // Datenstruktur 'Liste' ist

                    try {
                      // fertig den Post abschicken - schaue dir dazu die
                      // Klasse unter
                      // lib/features/feed/data/feed.repository.impl.dart
                      // an. Diese Klasse kann das. Wenn das Abschicken geklappt
                      // hat, dann kehre zur FeedPage zurück.
                       await  ref.read(FeedProviders.feedRepository).createPost(comment: commentTextController.value.text, tags: list, image: widget.image );
                       GoRouter.of(context).push('/feed',);
                      throw Exception();

                    } catch (e) {

                      // TODO(team): Aufgabe: Erstelle den Fehlerdialog hier,
                      // falls ein Fehler aufgetreten ist.
                      await showDialog(context: context, builder: buildAlertDialog);
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
