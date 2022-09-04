import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../models/need_to_verify_model.dart';
import 'need_to_verify_item.dart';

class NeedToVerifyList extends StatefulWidget {
  const NeedToVerifyList({
    super.key,
    required this.needToVerify,
    required this.pendingAmount,
  });

  final List<NeedToVerifyModel> needToVerify;
  final int pendingAmount;

  @override
  State<NeedToVerifyList> createState() => _NeedToVerifyListState();
}

class _NeedToVerifyListState extends State<NeedToVerifyList> {
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
                l10n.bonusServicesLabel,
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
          (index) => NeedToVerifyItem(
            key: UniqueKey(),
            needToVerify: widget.needToVerify[index],
            pendingAmount: widget.pendingAmount,
          ),
        ),
      ],
    );
  }
}
