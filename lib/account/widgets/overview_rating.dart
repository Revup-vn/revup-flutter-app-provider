import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class OverviewRating extends StatelessWidget {
  const OverviewRating({
    Key? key,
    required this.onTap,
    required this.rating,
  }) : super(key: key);

  final VoidCallback onTap;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AutoSizeText(
            rating.toString(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ) ??
                const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            width: 30,
            child: Icon(
              Icons.star,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
