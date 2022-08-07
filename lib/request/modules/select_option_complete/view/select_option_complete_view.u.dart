import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../../../l10n/l10n.dart';
import '../widgets/select_bonus_service_item.u.dart';
import '../widgets/select_service_request_item.u.dart';

class SelectOptionCompleteView extends StatelessWidget {
  const SelectOptionCompleteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // TODO(tcmhoang): depressed cannot review this file
    /// someone please help m

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              // TODO(namngoc231): next
            },
            child: Text(l10n.nextLabel),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        AutoSizeText(
                          l10n.selectCompletedItemLabel,
                          style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold) ??
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: AutoSizeText(
                            l10n.messagesSelectItemLabel,
                            style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ) ??
                                TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const SelectServiceRequestItem(),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SelectBonusServicetItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
