import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:revup_core/core.dart';

import '../../account/widgets/default_avatar.dart';
import '../../l10n/l10n.dart';
import '../../router/router.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    required this.orderNumber,
    required this.vehicleType,
    required this.serviceName,
    required this.serviceStartBooking,
    required this.orderStatusNotification,
    required this.textStyleNotification,
    required this.user,
  });
  final String orderNumber;
  final String vehicleType;
  final String serviceName;
  final DateTime serviceStartBooking;
  final String orderStatusNotification;
  final TextStyle textStyleNotification;
  final AppUser user;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final formatterDate = DateFormat('dd/MM/yyyy hh:mm');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () => context.router.push(
            const HistoryProviderDetailRoute(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    '${l10n.codeOrderLabel}$orderNumber',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AutoSizeText(
                    '${l10n.serviceLabel}$vehicleType - $serviceName',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AutoSizeText(
                    formatterDate.format(serviceStartBooking),
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
                // mainAxisAlignment: MainAxisAlignment.start,
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
                            imageUrl: user.avatarUrl,
                            placeholder: (context, url) {
                              return DefaultAvatar(
                                textSize:
                                    Theme.of(context).textTheme.titleLarge,
                                userName: '${user.firstName} ${user.lastName}',
                              );
                            },
                            errorWidget: (context, url, dynamic error) {
                              return DefaultAvatar(
                                textSize:
                                    Theme.of(context).textTheme.titleLarge,
                                userName: '${user.firstName} ${user.lastName}',
                              );
                            },
                            height: 64,
                            width: 64,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      AutoSizeText(
                        '${user.firstName} ${user.lastName}',
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
              orderStatusNotification,
              style: textStyleNotification,
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
