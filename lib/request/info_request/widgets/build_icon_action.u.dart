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
          color: const Color(0xFF7D5700),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.5,
              blurRadius: 0.1,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Icon(iconData, color: Colors.white, size: 16),
      ),
    );
  }
}
