import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/fallbacks.dart';
import 'default_avatar.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.userName,
    required this.urlImage,
    required this.localImg,
    this.callback,
  });
  final String userName;
  final String urlImage;
  final File localImg;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 130,
          width: 130,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: localImg.path.isEmpty
                ? CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 50),
                    fadeOutDuration: const Duration(milliseconds: 50),
                    imageUrl: urlImage.isEmpty ? kFallbackImage : urlImage,
                    placeholder: (context, url) {
                      return DefaultAvatar(
                        textSize: Theme.of(context).textTheme.headline1,
                        userName: userName,
                      );
                    },
                    errorWidget: (context, url, dynamic error) {
                      return DefaultAvatar(
                        textSize: Theme.of(context).textTheme.headline1,
                        userName: userName,
                      );
                    },
                    height: 64,
                    width: 64,
                    fit: BoxFit.fill,
                  )
                : Image.file(localImg, fit: BoxFit.fill),
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
