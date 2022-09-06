import 'package:flutter/material.dart';

class SimpleDialogCustom extends StatelessWidget {
  const SimpleDialogCustom({
    super.key,
    required this.content,
    required this.button,
    this.height,
    this.width,
  });
  final List<Widget> content;
  final List<Widget> button;
  final int? height;
  final int? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Container(
        height: height?.toDouble(),
        width: width?.toDouble(),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: content,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: button,
            ),
          ],
        ),
      ),
    );
  }
}
