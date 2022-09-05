import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, this.onPressed, required this.text});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style,
        child: AutoSizeText(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
