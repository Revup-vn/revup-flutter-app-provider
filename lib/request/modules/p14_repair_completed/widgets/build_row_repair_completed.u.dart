import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class BuildRowRepairCompletedItem extends StatelessWidget {
  const BuildRowRepairCompletedItem({
    super.key,
    required this.title,
    required this.content,
    required this.textButtonName,
  });
  final String title;
  final String content;
  final String textButtonName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          title,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ) ??
              TextStyle(
                color: Theme.of(context).colorScheme.outline,
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ) ??
                  const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (textButtonName.isNotEmpty)
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onPressed: () {
                  // TODO(namngoc231): fix again
                },
                child: Text(
                  textButtonName,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
