import 'dart:io';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../shared/shared.dart';

class IdImage extends StatelessWidget {
  const IdImage(
    this.coverHeight,
    this.backgroundImg, {
    super.key,
  });
  final double coverHeight;
  final File backgroundImg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
