import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class DefaultAvatar extends StatelessWidget {
  const DefaultAvatar({
    super.key,
    required this.textSize,
    required this.userName,
  });
  final TextStyle? textSize;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Stack(
        children: [
          Align(
            child: AutoSizeText(
              userName == '' ? 'R' : userName[0].toUpperCase(),
              style: textSize?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ) ??
                  textSize,
            ),
          ),
        ],
      ),
    );
  }
}
