import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';

import '../../../../app_theme.dart';

/// Login Screen Widget
class LoginScreen extends ConsumerStatefulWidget {
  /// constructor
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget buildAlertDialog(BuildContext context) {
    const title = 'Anmeldung fehlgeschlagen';
    const content = 'Dein Benutzername und/oder Passwort sind nicht korrekt.';
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

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Stack(
              children: [
                if (Orientation.portrait == orientation)
                  SizedBox(
                    height: constraint.maxHeight * 0.25,
                    width: constraint.maxWidth,
                    child: Image.asset(
                      'assets/images/login_header_image.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: Orientation.portrait == orientation
                        ? constraint.maxHeight * 0.8
                        : constraint.maxHeight,
                    width: constraint.maxWidth,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // TODO(team): Denk dir einen eigenen Namen für diese
                          // App aus und ersetze Sommerbootcamp '23 unten mit
                          // dem Namen, den du dir ausgedacht hast.
                          Text(
                            "Sommerbootcamp '23",
                            style: TextStyle(
                              fontFamily: AppTheme.pacificoFontName,
                              fontSize: 24,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              'Melde dich an um fortzufahren...',
                              style: textTheme.bodySmall,
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: SizedBox(
                              width: constraint.maxWidth * 0.85,
                              height: constraint.maxHeight * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      hintText: 'eMail',
                                      helperText: '',
                                      prefixIcon: Icon(Icons.email_outlined),
                                    ),
                                    validator:
                                        ValidationBuilder(localeName: 'de')
                                            .required()
                                            .email()
                                            .build(),
                                  ),
                                  TextFormField(
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      hintText: 'Passwort',
                                      helperText: '',
                                      prefixIcon:
                                          const Icon(Icons.lock_outline),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          // TODO(team): Aufgabe: Implementiere
                                          // eine Funktion die das Passwort im
                                          // Klartext zur Kontrolle anzeigt

                                          // Antwort A
                                          // _obscurePassword =
                                          // !_obscurePassword;

                                          // Antwort B
                                          // setState(() {
                                          //   _obscurePassword =
                                          //       !_obscurePassword;
                                          // });

                                          // Antwort C
                                          // setState(() {
                                          //   true
                                          // });
                                        },
                                        // TODO(team): Das Icon soll sich ändern, je
                                        // nachdem ob das Passwort angezeigt
                                        // wird oder nicht. Suche dir ein
                                        // passendes Icon, dass angezeigt
                                        // wird, wenn man das Passwort lesen
                                        // kann.
                                        icon: const Icon(
                                          Icons.remove_red_eye_outlined,
                                        ),
                                      ),
                                    ),
                                    obscureText: _obscurePassword,
                                    validator:
                                        ValidationBuilder(localeName: 'de')
                                            .required()
                                            .build(),
                                  ),
                                  MaterialButton(
                                    onPressed: () async {
                                      try {
                                        // TODO: validiere das Feld für Passwort
                                        // und Email. Schaue dir dazu die
                                        // Variable _formKey an und was sie
                                        // kann.
                                        if (true) {
                                          return;
                                        }

                                        // TODO: logge dich mit Nutzername und
                                        // Passwort ein schaue dir dazu die
                                        // Klasse unter
                                        // lib/features/auth/data/auth.repository.impl.dart
                                        // an. Diese Klasse kann das.
                                      } catch (e) {
                                        // TODO(team): Aufgabe: Implementiere
                                        // die Nutzeranmeldung, bei einem Fehler
                                        // soll dieser entsprechend angezeigt
                                        // werden Tipp: schau dir die Funktion
                                        // 'buildAlertDialog' weiter oben an.
                                        // Recherchiere außerdem wie man einen
                                        // Dialog in einer Flutter App anzeigt.
                                      }
                                    },
                                    minWidth: double.infinity,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    textColor: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    // TODO(team): Auf der Loginseite abmelden?
                                    // Das kann nicht stimmen! Ändere den Text
                                    // in etwas sinnvolleres.
                                    child: const Text('Abmelden'),
                                  ),
                                  const Text('Passwort vergessen')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
