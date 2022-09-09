import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../shared/shared.dart';
import '../../shared/widgets/custom_dialog.dart';
import '../widgets/product_checkbox_group.dart';

class CommonProductView extends StatelessWidget {
  CommonProductView(this.products, this.complete, {super.key});
  final List<RepairProduct> products;
  final form = GlobalKey<FormBuilderState>();
  final Completer<List<Tuple2<RepairProduct, File>>> complete;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return WillPopScope(
      onWillPop: () async {
        var isPop = false;
        form.currentState?.save();
        final saveLst = form.currentState?.value['product'] != null
            ? form.currentState?.value['product']
                as List<Tuple2<RepairProduct, File>>
            : nil<Tuple2<RepairProduct, File>>().toList();

        if (saveLst.isEmpty) {
          await showDialog<String>(
            barrierDismissible: false,
            context: context,
            builder: (bcontext) {
              return SimpleDialogCustom(
                height: 150,
                content: [
                  AutoSizeText(
                    l10n.chooseNoProduct,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  AutoSizeText(
                    context.l10n.sureLabel,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
                button: [
                  TextButton(
                    onPressed: () {
                      complete.complete(saveLst);
                      bcontext.router.pop();
                    },
                    child: Text(l10n.yesLabel),
                  ),
                  TextButton(
                    onPressed: () {
                      isPop = false;
                      bcontext.router.pop();
                    },
                    child: Text(l10n.cancelLabel),
                  )
                ],
              );
            },
          );
        } else {
          complete.complete(saveLst);
        }
        return isPop;
      },
      child: DismissKeyboard(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: AutoSizeText(
                l10n.addCommonLabel,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            body: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 100),
                  physics: const BouncingScrollPhysics(),
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
                    decoration:
                        BoxDecoration(color: Theme.of(context).cardColor),
                    child: ElevatedButton(
                      onPressed: () {
                        // get value from form

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
        ),
      ),
    );
  }
}
