import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class MyReviewItem extends StatelessWidget {
  const MyReviewItem({
    super.key,
    required this.numberOfStars,
    required this.callback,
    required this.onPressed,
  });
  final String numberOfStars;
  final VoidCallback callback;
  final bool onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Chip(
          backgroundColor: onPressed
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceVariant,
          avatar: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.star,
              size: 20,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          label: AutoSizeText(
            numberOfStars,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ) ??
                TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    );
  }
}
