import 'dart:io';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

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
        if (imgUrl.isEmpty)
          SizedBox(
            child: backgroundImg.path.isEmpty
                ? CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: coverHeight,
                    imageUrl: kFallbackBackground,
                  )
                : Image.file(
                    backgroundImg,
                    fit: BoxFit.fill,
                    height: coverHeight,
                    width: double.infinity,
                  ),
          )
        else
          SizedBox(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: coverHeight,
              imageUrl: imgUrl,
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
