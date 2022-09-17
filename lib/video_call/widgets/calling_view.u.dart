import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'callee_avatar.u.dart';

class CallingView extends StatelessWidget {
  const CallingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const CalleeAvatar(
                        'https://vcdn1-giaitri.vnecdn.net/2020/11/03/lisa-6-1604394415.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=2uX86_Jm0qtPjfD7wkRD3w'),
                    AutoSizeText(
                      'Nguyễn Văn A',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const AutoSizeText('Calling'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            color: Colors.blue,
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.mic,
                              size: 24,
                            ),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            color: Colors.blue,
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.videocam,
                              size: 24,
                            ),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            color: Colors.blue,
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.flip_camera_ios_outlined,
                              size: 24,
                            ),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            color: Theme.of(context).colorScheme.error,
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.call_end,
                              size: 24,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
