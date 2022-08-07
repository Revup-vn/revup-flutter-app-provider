import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../bloc/info_request_bloc.dart';
import '../widgets/build_row_item_info_request.u.dart';
import '../widgets/contact_item.u.dart';

class InfoRequestView extends StatelessWidget {
  const InfoRequestView({
    super.key,
  });
  // TODO(tcmhoang): depressed cannot review this file
  /// someone please help me

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
            success: (infoRequestModel) => Column(
              children: [
                Expanded(
                  flex: 8,
                  child: SafeArea(
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
                          // CONTACT
                          ContactItem(user: infoRequestModel.user),
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
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
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
                ),
                Expanded(
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
