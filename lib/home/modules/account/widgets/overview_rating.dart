import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OverviewRating extends StatelessWidget {
  const OverviewRating({
    super.key,
    required this.onTap,
    required this.rating,
  });

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
            rating.isNaN || rating == 0 ? '0' : rating.toStringAsFixed(1),
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
