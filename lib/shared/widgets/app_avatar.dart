import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 48,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: 64,
          width: 64,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
