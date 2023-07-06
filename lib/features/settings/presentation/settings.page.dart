import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/shared.dart';

/// SettingsPage
class SettingsPage extends ConsumerWidget {
  /// constructor
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.read(AuthProviders.authRepository);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         // TODO = fertig
          ElevatedButton(
            onPressed: () async {
              await authRepository.signOut();
            },
            child: const Text('Abmelden', textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
