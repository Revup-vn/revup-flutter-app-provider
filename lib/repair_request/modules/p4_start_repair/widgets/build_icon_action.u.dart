import 'package:flutter/material.dart';

class BuildIconAction extends StatelessWidget {
  const BuildIconAction({
    super.key,
    required this.iconData,
    required this.callback,
  });
  final IconData iconData;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.outline,
              spreadRadius: 0.5,
              blurRadius: 0.1,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Icon(
          iconData,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 16,
        ),
      ),
    );
  }
}
