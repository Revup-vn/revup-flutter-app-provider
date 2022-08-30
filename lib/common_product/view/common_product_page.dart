import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../widgets/product_checkbox_group.dart';

class CommonProductPage extends StatelessWidget {
  CommonProductPage(this.products, this.complete, {super.key});
  final List<RepairProduct> products;
  final form = GlobalKey<FormBuilderState>();
  final Completer<List<RepairProduct>> complete;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  FormBuilder(
                    key: form,
                    child: ServiceCheckboxGroup(
                      serviceList: products,
                      formField: form,
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
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: ElevatedButton(
                  onPressed: () {
                    // get value from form
                    form.currentState?.save();
                    final saveLst = form.currentState?.value['product'] != null
                        ? form.currentState?.value['product']
                            as List<RepairProduct>
                        : nil<RepairProduct>().toList();

                    if (saveLst.isEmpty) {
                      showDialog<String>(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: Column(
                                    children: [
                                      AutoSizeText(
                                        'khong chon product',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onTertiary,
                                            ),
                                      ),
                                      AutoSizeText(
                                        context.l10n.sureLabel,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onTertiary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          complete.complete(saveLst);

                                          var count = 0;
                                          context.router.popUntil(
                                            (route) => count++ == 2,
                                          );
                                        },
                                        child: Text(l10n.confirmLabel),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context.router.pop();
                                        },
                                        child: Text(l10n.cancelLabel),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                      return;
                    }
                    complete.complete(saveLst);
                    context.router.pop();
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: AutoSizeText(l10n.confirmLabel),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
