import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../l10n/l10n.dart';
import '../../models/pending_service_model.dart';
import '../p12_detail_order/cubit/quote_price_cubit.dart';

class NeedToVerifyItem extends StatefulWidget {
  const NeedToVerifyItem({
    super.key,
    required this.needToVerify,
    required this.pendingAmount,
  });
  final PendingServiceModel needToVerify;
  final int pendingAmount;

  @override
  State<NeedToVerifyItem> createState() => _NeedToVerifyItemState();
}

class _NeedToVerifyItemState extends State<NeedToVerifyItem> {
  final _price = GlobalKey<FormBuilderFieldState<dynamic, dynamic>>();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuotePriceCubit>();
    return TextButton(
      onPressed: () async {
        await quotePriceDialog().then((value) async {
          await cubit.quotePrice(
            widget.needToVerify,
            int.parse(value ?? ''),
          );
        });
      },
      child: AutoSizeText(
        context.l10n.quoteLabel,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        maxFontSize: 12,
        minFontSize: 8,
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
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.match(
                          r'^[0-9]{1,9}$',
                          errorText: context.l10n.invalidFormatLabel,
                        ),
                      ]),
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
