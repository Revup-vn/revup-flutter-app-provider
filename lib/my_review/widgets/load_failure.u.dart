import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LoadFailure extends StatelessWidget {
  const LoadFailure({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Expanded(
                    child: AutoSizeText(
                      'There currently no feedback yet',
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Center(
          child: Icon(
            Icons.comments_disabled_outlined,
            size: 128,
          ),
        ),
      ],
    );
  }
}
