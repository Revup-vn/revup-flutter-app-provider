import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: FilterChip(
        elevation: 0,
        shape: const StadiumBorder(side: BorderSide()),
        onSelected: (bool value) {
          callback();
        },
        backgroundColor: onPressed
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
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
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
