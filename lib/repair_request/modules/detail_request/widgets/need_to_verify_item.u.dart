import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../l10n/l10n.dart';
import '../../../models/need_to_verify_model.dart';

class NeedToVerifyItem extends StatefulWidget {
  const NeedToVerifyItem({
    super.key,
    required this.needToVerify,
  });

  final List<NeedToVerifyModel> needToVerify;

  @override
  State<NeedToVerifyItem> createState() => _NeedToVerifyItemState();
}

class _NeedToVerifyItemState extends State<NeedToVerifyItem> {
  // late TextEditingController controller;
  final _price = GlobalKey<FormBuilderFieldState>();
  // @override
  // void initState() {
  //   super.initState();
  //   controller = TextEditingController();
  // }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText(
                l10n.serviceRequestLabel,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ) ??
                    TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        ...List.generate(
          widget.needToVerify.length,
          (index) => SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AutoSizeText(
                  widget.needToVerify[index].serviceName,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextButton(
                  onPressed: () async {
                    final quotePrice = await quotePriceDialog();
                  },
                  child: AutoSizeText(
                    l10n.touchToQuoteLabel,
                    style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Theme.of(context).primaryColor) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
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
