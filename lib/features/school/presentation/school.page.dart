import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// SchoolPage
class SchoolPage extends ConsumerWidget {
  /// constructor
  const SchoolPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hausaufgaben'),
      ),
      body: Container(),
    );
  }
}
