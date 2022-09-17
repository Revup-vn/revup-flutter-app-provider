import 'package:flutter/material.dart';

class CalleeAvatar extends StatelessWidget {
  const CalleeAvatar(this.imageUrl, {super.key});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // RippleAnimation(
        //   minRadius: 40,
        //   color: Theme.of(context).colorScheme.onSurface,
        //   repeat: true,
        //   child: SizedBox(
        //     width: 128,
        //     height: 128,
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(68),
        //       child: CircleAvatar(
        //         child: CachedNetworkImage(
        //           colorBlendMode: BlendMode.modulate,
        //           imageUrl: imageUrl,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
