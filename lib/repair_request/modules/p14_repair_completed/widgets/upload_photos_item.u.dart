import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';

class UploadPhotosItem extends StatelessWidget {
  const UploadPhotosItem({
    super.key,
    required this.onUpdatedImageTile,
  });

  // TODO(tcmhoang) : Get the actual img here

  final Function1<Future<List<StorageFile>>, void> onUpdatedImageTile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          l10n.pictureLabel,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ) ??
              TextStyle(
                color: Theme.of(context).colorScheme.outline,
              ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                Icons.add_photo_alternate_outlined,
                size: 40,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 64,
                child: ListView.builder(
                  itemCount: 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      // TODO(tcmhoang): Get a more
                      // general image for place holder
                      '',
                      height: 50,
                      width: 50,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
