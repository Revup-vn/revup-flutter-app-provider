import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class BuildRowItem extends StatelessWidget {
  const BuildRowItem({
    super.key,
    required this.iconData,
    required this.text,
    required this.textBold,
  });
  final IconData iconData;
  final String text;
  final String textBold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(iconData, size: 16),
          const SizedBox(width: 10),
          AutoSizeText(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: AutoSizeText(
              textBold,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ) ??
                  const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
