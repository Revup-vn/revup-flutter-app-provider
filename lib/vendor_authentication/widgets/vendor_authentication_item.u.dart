import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class VendorAuthenticationItem extends StatelessWidget {
  const VendorAuthenticationItem({
    super.key,
    required this.prefix,
    required this.suffixes,
  });

  final String prefix;
  final String suffixes;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              prefix,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ) ??
                  TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            AutoSizeText(
              suffixes,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ) ??
                  TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
