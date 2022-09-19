import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../shared/shared.dart';
import '../../../../shared/utils/utils_function.dart';
import '../../../../video_call/bloc/video_call_bloc.dart';
import 'build_icon_action.u.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.consumer,
  });
  final AppUser consumer;
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
              imageUrl: consumer.avatarUrl,
              placeholder: (context, url) {
                return DefaultAvatar(
                  textSize: Theme.of(context).textTheme.titleLarge,
                  userName: '${consumer.firstName} ${consumer.lastName}',
                );
              },
              errorWidget: (context, url, dynamic error) {
                return DefaultAvatar(
                  textSize: Theme.of(context).textTheme.titleLarge,
                  userName: '${consumer.firstName} ${consumer.lastName}',
                );
              },
              height: 64,
              width: 64,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AutoSizeText(
            '${consumer.firstName} ${consumer.lastName}',
            style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold) ??
                const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const Spacer(),
        BuildIconAction(
          iconData: Icons.phone,
          callback: () {
            makePhoneCall(consumer.phone);
          },
        ),
        const SizedBox(width: 10),
        BuildIconAction(
          iconData: Icons.video_camera_back_outlined,
          callback: () {
            context
                .read<VideoCallBloc>()
                .add(const VideoCallEvent.callStarted());
          },
        ),
      ],
    );
  }
}
