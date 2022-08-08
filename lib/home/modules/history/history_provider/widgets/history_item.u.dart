import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../shared/widgets/widgets.dart';
import '../models/models.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    required this.data,
    required this.onTap,
    required this.textColor,
  });
  final HistoryItemModel data;
  final VoidCallback onTap;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // TODO(tcmhoang): Get datformat from LanguageCubit
    final formatterDate = DateFormat('dd/MM/yyyy hh:mm');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    '${l10n.codeOrderLabel}${data.orderNumber}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AutoSizeText(
                    '${l10n.serviceLabel}${data.vehicleType}'
                    ' - ${data.serviceName}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AutoSizeText(
                    formatterDate.format(data.serviceStartBooking),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ) ??
                        TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(48),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 50),
                            fadeOutDuration: const Duration(milliseconds: 50),
                            imageUrl: data.user.urlImage,
                            placeholder: (context, url) => DefaultAvatar(
                              textSize: Theme.of(context).textTheme.titleLarge,
                              userName: data.user.name,
                            ),
                            errorWidget: (context, url, dynamic error) =>
                                DefaultAvatar(
                              textSize: Theme.of(context).textTheme.titleLarge,
                              userName: data.user.name,
                            ),
                            height: 64,
                            width: 64,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      AutoSizeText(
                        data.user.name,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AutoSizeText(
              data.orderStatusNotification,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColor,
                      ) ??
                  TextStyle(color: textColor),
            ),
          ],
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