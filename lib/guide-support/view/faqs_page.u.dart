import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../l10n/l10n.dart';
import '../../router/app_router.gr.dart';
import '../widgets/faqs_item_detail.u.dart';

class FAQsPage extends StatelessWidget {
  const FAQsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          l10n.faqsLabel,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 12, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FAQsItem(
                faqsName: l10n.questionOTPLabel,
                callback: () {
                  context.router.push(
                    const FAQsItemOTPRoute(),
                  );
                },
              ),
              FAQsItem(
                faqsName: l10n.questionCallLabel,
                callback: () {
                  context.router.push(
                    const AboutUsRoute(),
                  );
                },
              ),
              FAQsItem(
                faqsName: l10n.questionCallLabel,
                callback: () {
                  context.router.push(
                    const TermsPrivacyRoute(),
                  );
                },
              ),
              FAQsItem(
                faqsName: l10n.questionAccountLabel,
                callback: () => context.showToast<void>(l10n.notSupportLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
