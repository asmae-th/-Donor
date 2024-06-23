import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Like extends StatelessWidget {
  final bool isLiked;
  void Function()? onTap;
 Like({super.key, required this.isLiked, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked ? Colors.red : Colors.grey,
        ),

    );
  }
}
