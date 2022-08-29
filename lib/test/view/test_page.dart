import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';

class TestPage extends StatelessWidget {
  const TestPage(this.providerID, {super.key});
  final String providerID;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.revupAppBarTitle)),
      body: Center(child: Text(providerID)),
    );
  }
}
