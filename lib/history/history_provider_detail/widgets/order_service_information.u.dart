import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../l10n/l10n.dart';
import '../../../shared/shared.dart';

class OrderServiceInformationItem extends StatelessWidget {
  const OrderServiceInformationItem({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SizedBox(
      height: 160,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30,
                  child: Icon(
                    const IconData(
                      0xe13d,
                      fontFamily: 'MaterialIcons',
                    ),
                    size: 30,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                AutoSizeText(
                  l10n.serviceInforLabel,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ) ??
                      const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(48),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(
                              milliseconds: 50,
                            ),
                            fadeOutDuration: const Duration(
                              milliseconds: 50,
                            ),
                            imageUrl: user.urlImage,
                            placeholder: (context, url) {
                              return DefaultAvatar(
                                textSize:
                                    Theme.of(context).textTheme.titleLarge,
                                userName: user.name,
                              );
                            },
                            errorWidget: (context, url, dynamic error) {
                              return DefaultAvatar(
                                textSize:
                                    Theme.of(context).textTheme.titleLarge,
                                userName: user.name,
                              );
                            },
                            height: 64,
                            width: 64,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      AutoSizeText(
                        user.name,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                            child: Icon(
                              Icons.phone,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                          ),
                          AutoSizeText(
                            '${l10n.telLabel}${user.phone}',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                            child: Icon(
                              const IconData(
                                0xe3ab,
                                fontFamily: 'MaterialIcons',
                              ),
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          Expanded(
                            child: AutoSizeText(
                              '${l10n.addressLabel}${user.address}',
                              style: Theme.of(context).textTheme.labelLarge,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
