import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain.dart';

/// Actions on a Post Item
class PostAction extends StatefulWidget {
  /// constructor
  const PostAction({required this.postModel, super.key});

  /// POstModel
  final PostModel postModel;

  @override
  State<StatefulWidget> createState() {
    return PostActionState();
  }
}

class PostActionState extends State<PostAction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                // the magic happens here ...
              });
            },
            child: const Icon(Icons.favorite_outline),
          ),
          Text(
            DateFormat('dd.MM.yyyy HH:mm').format(widget.postModel.createdAt),
          ),
        ],
      ),
    );
  }
}
