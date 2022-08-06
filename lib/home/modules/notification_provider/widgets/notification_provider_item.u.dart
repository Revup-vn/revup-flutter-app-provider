import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';

import '../../../../l10n/l10n.dart';
import '../models/models.dart';

class NotificationProviderItem extends StatelessWidget {
  const NotificationProviderItem({
    super.key,
    required this.data,
  });
  final NotificationProviderModel data;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // TODO(tcmhoang): Get datformat from LanguageCubit
    final formatterDate = DateFormat('dd/MM/yyyy hh:mm');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AutoSizeText(
          data.orderStatusNotification,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ) ??
              TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(
          height: 16,
        ),
        AutoSizeText(
          '${l10n.codeOrderLabel}${data.orderNumber}',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ) ??
              TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(
          height: 16,
        ),
        AutoSizeText(
          formatterDate.format(data.serviceStartBooking),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ) ??
              TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
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
      ],
    );
  }
}
