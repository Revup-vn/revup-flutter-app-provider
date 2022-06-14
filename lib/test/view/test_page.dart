import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.revupAppBarTitle)),
      body: const Center(child: Text('REVUP APP')),
    );
  }
}
