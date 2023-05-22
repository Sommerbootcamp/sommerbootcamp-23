import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../shared.dart';
import 'widgets/post.dart';

/// Feedpage
class FeedPage extends ConsumerWidget {
  /// constructor
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allPosts = ref.watch(FeedProviders.getAllPosts);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/feed/add');
            },
            icon: const Icon(Icons.add_box_outlined),
          ),
        ],
      ),
      body: allPosts.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh: () async {
              allPosts = ref.refresh(FeedProviders.getAllPosts);
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...data.map((e) => Post(postModel: e)),
                ],
              ),
            ),
          );
        },
        error: (error, _) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
