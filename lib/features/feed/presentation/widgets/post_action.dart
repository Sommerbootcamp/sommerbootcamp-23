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
  bool _color = true;


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
              _color =
              !_color;
              });
            },
      child: _color ?  const Icon(
          Icons.favorite_outline, color: Colors.black,) :
      const Icon(Icons.favorite, color: Colors.red,)

          ),
          Text(
            DateFormat('dd.MM.yyyy HH:mm').format(widget.postModel.createdAt),


          ),
        ],
      ),
    );
  }

}