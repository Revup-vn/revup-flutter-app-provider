import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/l10n.dart';
import '../bloc/info_request_bloc.dart';
import '../widgets/build_icon_action.u.dart';
import '../widgets/build_row_item.u.dart';
import '../widgets/default_avatar.dart';

class InfoRequestView extends StatelessWidget {
  const InfoRequestView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<InfoRequestBloc, InfoRequestState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Text('Empty'),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: () => const Text('Failed'),
            success: (infoRequestModel) => Stack(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          l10n.requestInformationReceivedLabel,
                          style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold) ??
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(48),
                                child: CachedNetworkImage(
                                  fadeInDuration:
                                      const Duration(milliseconds: 50),
                                  fadeOutDuration:
                                      const Duration(milliseconds: 50),
                                  imageUrl: infoRequestModel.user.firstName +
                                      infoRequestModel.user.lastName,
                                  placeholder: (context, url) {
                                    return DefaultAvatar(
                                      textSize: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      userName:
                                          infoRequestModel.user.firstName +
                                              infoRequestModel.user.lastName,
                                    );
                                  },
                                  errorWidget: (context, url, dynamic error) {
                                    return DefaultAvatar(
                                      textSize: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      userName:
                                          infoRequestModel.user.firstName +
                                              infoRequestModel.user.lastName,
                                    );
                                  },
                                  height: 64,
                                  width: 64,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            AutoSizeText(
                              '''${infoRequestModel.user.firstName} ${infoRequestModel.user.lastName}''',
                              style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold) ??
                                  const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Spacer(),
                            BuildIconAction(
                              iconData: Icons.phone,
                              callback: () {
                                // TODO(namngoc231): call comsumer
                              },
                            ),
                            const SizedBox(width: 10),
                            BuildIconAction(
                              iconData: Icons.video_camera_back_outlined,
                              callback: () {
                                // TODO(namngoc231): video call comsumer
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1),
                        const SizedBox(height: 10),
                        BuildRowItem(
                          iconData: Icons.social_distance,
                          text: l10n.distanceLabel,
                          textBold: '${infoRequestModel.distance}km',
                        ),
                        BuildRowItem(
                          iconData: Icons.directions_run,
                          text: l10n.feeTransportLabel,
                          textBold: '${infoRequestModel.feeTransport}Đ',
                        ),
                        BuildRowItem(
                          iconData: Icons.directions_bike,
                          text: l10n.vehicleTypeLabel,
                          textBold: infoRequestModel.vehicleType,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.description_outlined, size: 16),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: AutoSizeText(
                                infoRequestModel.message,
                                textAlign: TextAlign.start,
                                softWrap: true,
                                style: Theme.of(context).textTheme.bodyLarge,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: BuildRowItem(
                                iconData: Icons.build,
                                text: l10n.serviceLabel,
                                textBold:
                                    infoRequestModel.totalService.toString() +
                                        l10n.categoriesLabel,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: GestureDetector(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    // TODO(namngoc231): quote
                                  },
                                  child: Text(l10n.quoteLabel),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1),
                        const SizedBox(height: 10),
                        AutoSizeText(
                          l10n.messagesCallForCustomersLabel,
                          style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ) ??
                              TextStyle(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        width: MediaQuery.of(context).size.width,
                        decoration:
                            BoxDecoration(color: Theme.of(context).cardColor),
                        child: ElevatedButton(
                          onPressed: null,
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: AutoSizeText(
                            l10n.startLabel,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
