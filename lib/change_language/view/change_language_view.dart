import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../shared/widgets/custom_dialog.dart';

class ChangeLanguageView extends StatelessWidget {
  const ChangeLanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          context.l10n.languageLabel,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () async {
                  context
                      .read<LanguageCubit>()
                      .set(const LanguageState.vietnamese());
                  await _showDialog(context);
                  await context.router.pop();
                },
                child: AutoSizeText(
                  context.l10n.vietnameseLabel,
                  maxLines: 1,
                ),
              ),
              TextButton(
                onPressed: () async {
                  context
                      .read<LanguageCubit>()
                      .set(const LanguageState.english());
                  await _showDialog(context);
                  await context.router.pop();
                },
                child: AutoSizeText(
                  context.l10n.englishLabel,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    await showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (bcontext) => SimpleDialogCustom(
        height: 100,
        content: [
          Center(
            child: AutoSizeText(
              context.l10n.changeLangSuccessLabel,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
        button: [
          TextButton(
            onPressed: () {
              bcontext.router.pop();
            },
            child: AutoSizeText(
              context.l10n.understoodLabel,
            ),
          ),
        ],
      ),
    );
  }
}
