import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class FAQsItem extends StatelessWidget {
  const FAQsItem({super.key, required this.faqsName, required this.callback});
  final String faqsName;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: callback,
          child: ListTile(
            title: AutoSizeText(
              faqsName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 12, 0),
          child: Divider(
            height: 1,
            thickness: 1,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
