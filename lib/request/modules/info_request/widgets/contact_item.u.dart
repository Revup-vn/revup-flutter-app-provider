import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../shared/shared.dart';
import 'build_icon_action.u.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(48),
            child: CachedNetworkImage(
              fadeInDuration: const Duration(milliseconds: 50),
              fadeOutDuration: const Duration(milliseconds: 50),
              imageUrl: user.urlImage,
              placeholder: (context, url) {
                return DefaultAvatar(
                  textSize: Theme.of(context).textTheme.titleLarge,
                  userName: user.name,
                );
              },
              errorWidget: (context, url, dynamic error) {
                return DefaultAvatar(
                  textSize: Theme.of(context).textTheme.titleLarge,
                  userName: user.name,
                );
              },
              height: 64,
              width: 64,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const SizedBox(width: 10),
        AutoSizeText(
          user.name,
          style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold) ??
              const TextStyle(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Spacer(),
        BuildIconAction(
          iconData: Icons.phone,
          callback: () {
            // TODO(namngoc231): call comsumer
          },
        ),
        const SizedBox(width: 10),
        BuildIconAction(
          iconData: Icons.video_camera_back_outlined,
          callback: () {
            // TODO(namngoc231): video call comsumer
          },
        ),
      ],
    );
  }
}
