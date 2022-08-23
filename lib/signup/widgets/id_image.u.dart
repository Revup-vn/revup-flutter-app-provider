import 'dart:io';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../shared/shared.dart';

class IdImage extends StatelessWidget {
  const IdImage(
    this.coverHeight,
    this.backgroundImg, {
    super.key,
    this.callback,
  });
  final double coverHeight;
  final File backgroundImg;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          child: backgroundImg.path.isEmpty
              ? CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: coverHeight,
                  height: coverHeight,
                  imageUrl: kFallbackBackground,
                )
              : Image.file(
                  backgroundImg,
                  fit: BoxFit.fill,
                  height: coverHeight,
                  width: coverHeight,
                ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: callback,
            icon: Icon(
              Icons.cancel,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
