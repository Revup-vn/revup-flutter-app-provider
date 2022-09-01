import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../gen/assets.gen.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: Center(
          child: LottieBuilder.asset(Assets.screens.loadingPrimaryColor),
        ),
      ),
    );
  }
}
