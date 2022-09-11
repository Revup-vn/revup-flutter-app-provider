import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../router/router.dart';
import '../../../../shared/utils/fallbacks.dart';
import '../../../../shared/widgets/loading.u.dart';
import '../bloc/choose_product_bloc.dart';

class ChooseProductView extends StatefulWidget {
  const ChooseProductView({super.key, required this.recordId});
  final String recordId;

  @override
  State<ChooseProductView> createState() => _ChooseProductViewState();
}

class _ChooseProductViewState extends State<ChooseProductView> {
  String? groupValue = '';
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.watch<ChooseProductBloc>();
    final cubit = context.read<NotificationCubit>();
    bloc.state.whenOrNull(
      initial: () => bloc.add(const ChooseProductEvent.started()),
    );

    return BlocBuilder<ChooseProductBloc, ChooseProductState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: Loading.new,
          success: (products) {
            return Scaffold(
              appBar: AppBar(
                title: AutoSizeText(l10n.chooseProductAppBarTitle),
                centerTitle: false,
              ),
              body: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.only(bottom: 100),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 0,
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 54,
                                    height: 54,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(48),
                                      child: CircleAvatar(
                                          child: CachedNetworkImage(
                                        imageUrl: products[index].img,
                                        errorWidget:
                                            (context, url, dynamic error) =>
                                                Assets.screens.setting.svg(
                                          fit: BoxFit.fill,
                                          height: 64,
                                          width: 64,
                                        ),
                                        height: 64,
                                        width: 64,
                                        fit: BoxFit.fill,
                                      )),
                                    ),
                                  ),
                                  title: AutoSizeText(
                                    products[index].name,
                                  ),
                                  subtitle: AutoSizeText(
                                    '${l10n.productPriceLabel}: '
                                    '${products[index].price}',
                                  ),
                                  trailing: Radio<String>(
                                    activeColor:
                                        Theme.of(context).colorScheme.primary,
                                    value: products[index].name,
                                    groupValue: groupValue,
                                    toggleable: true,
                                    onChanged: (String? value) {
                                      setState(() {
                                        groupValue = value;
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          if (groupValue?.isEmpty ?? false) {
                            context.router.pop();
                            return;
                          }
                          context.read<ChooseProductBloc>().add(
                                ChooseProductEvent.submitted(
                                  groupValue,
                                  widget.recordId,
                                  () => context.router.popUntil(
                                    (route) =>
                                        route.settings.name ==
                                        P12DetailRoute.name,
                                  ),
                                  (token, serviceName, productName, total) =>
                                      cubit.sendMessageToToken(
                                    SendMessage(
                                      title: 'Revup',
                                      body: '',
                                      token: token,
                                      icon: kRevupIconApp,
                                      payload: MessageData(
                                        type: NotificationType.NormalMessage,
                                        payload: <String, dynamic>{
                                          'subType': 'RecommendService',
                                          'serviceName': serviceName,
                                          'productName': productName,
                                          'total': total,
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                        },
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: AutoSizeText(l10n.confirmLabel),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
