import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ScorePage
class ScorePage extends ConsumerWidget {
  /// constructor
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notenspiegel'),
      ),
      body: Container(),
    );
  }
}
