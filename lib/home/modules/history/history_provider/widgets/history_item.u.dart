import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
  final HistoryProviderModel data;
  final VoidCallback onTap;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final formatterDate = DateFormat('dd/MM/yyyy HH:mm');

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
                    '''${l10n.codeOrderLabel}${data.orderNumber.length >= 7 ? data.orderNumber.substring(0, 8) : data.orderNumber}''',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AutoSizeText(
                    '''${l10n.serviceLabel} ${data.vehicleType == 0 ? l10n.motorcycleLabel : l10n.carLabel}''',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AutoSizeText(
                    formatterDate.format(data.timeCreated),
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
                            imageUrl: data.imgUrl,
                            placeholder: (context, url) => DefaultAvatar(
                              textSize: Theme.of(context).textTheme.titleLarge,
                              userName: data.userName,
                            ),
                            errorWidget: (context, url, dynamic error) =>
                                DefaultAvatar(
                              textSize: Theme.of(context).textTheme.titleLarge,
                              userName: data.userName,
                            ),
                            height: 64,
                            width: 64,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      AutoSizeText(
                        data.userName,
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
              data.orderStatus == 0
                  ? context.l10n.canceledLabel
                  : context.l10n.successLabel,
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
