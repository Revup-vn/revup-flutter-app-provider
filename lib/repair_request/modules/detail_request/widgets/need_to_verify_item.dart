import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../models/need_to_verify_model.dart';
import '../p10_quote_price/cubit/total_amount_cubit.dart';

class NeedToVerifyItem extends StatefulWidget {
  const NeedToVerifyItem({
    super.key,
    required this.needToVerify,
    required this.pendingAmount,
  });
  final NeedToVerifyModel needToVerify;
  final int pendingAmount;

  @override
  State<NeedToVerifyItem> createState() => _NeedToVerifyItemState();
}

class _NeedToVerifyItemState extends State<NeedToVerifyItem> {
  final _price = GlobalKey<FormBuilderFieldState>();
  String quotePrice = '';
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TotalAmountCubit>();

    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AutoSizeText(
            widget.needToVerify.serviceName,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          if (quotePrice.isEmpty)
            TextButton(
              onPressed: () async {
                final temp = await quotePriceDialog() ?? '';
                setState(() {
                  quotePrice = temp;
                });
                final isExist = await Hive.boxExists('verifyServices');

                final verifyServices = isExist
                    ? Hive.box<int>('verifyServices')
                    : await Hive.openBox<int>('verifyServices');

                await verifyServices.put(
                  widget.needToVerify.serviceName,
                  int.parse(quotePrice),
                );

                await cubit.updateTotal(
                  int.parse(quotePrice),
                );
              },
              child: AutoSizeText(
                context.l10n.touchToQuoteLabel,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            )
          else
            Text(context.formatMoney(int.parse(quotePrice))),
        ],
      ),
    );
  }

  Future<String?> quotePriceDialog() => showDialog<String>(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          insetPadding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                height: 200,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    FormBuilderTextField(
                      name: 'price',
                      key: _price,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: context.l10n.enterPriceLabel,
                      ),
                      validator: FormBuilderValidators.numeric(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_price.currentState?.validate() ?? false) {
                              context.router.pop(_price.currentState?.value);
                            }
                          },
                          child: Text(context.l10n.confirmLabel),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
