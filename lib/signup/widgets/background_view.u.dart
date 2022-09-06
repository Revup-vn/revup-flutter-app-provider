import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../shared/shared.dart';

class BackGroundView extends StatelessWidget {
  const BackGroundView(
    this.coverHeight,
    this.backgroundImg,
    this.callback,
    this.imgUrl, {
    super.key,
  });
  final double coverHeight;
  final File backgroundImg;
  final VoidCallback? callback;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: backgroundImg.path.isEmpty
              ? CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: coverHeight,
                  imageUrl: imgUrl.isEmpty ? kFallbackBackground : imgUrl,
                  errorWidget: (context, url, dynamic error) =>
                      Assets.screens.brgimg.image(
                    fit: BoxFit.fill,
                  ),
                )
              : Image.file(
                  backgroundImg,
                  fit: BoxFit.fill,
                  height: coverHeight,
                  width: double.infinity,
                ),
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(blurRadius: 5, spreadRadius: 0.1)],
            ),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              radius: 17,
              child: IconButton(
                onPressed: callback,
                icon: Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
