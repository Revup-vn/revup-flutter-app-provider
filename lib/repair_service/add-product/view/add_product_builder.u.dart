import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/l10n.dart';
import '../../../shared/widgets/loading.u.dart';
import '../bloc/add_product_bloc.dart';
import 'add_product_view.u.dart';

class AddProductBuilder extends StatelessWidget {
  const AddProductBuilder(this.type, {super.key});
  final int type;
  @override
  Widget build(BuildContext context) {
    context.watch<AddProductBloc>().state.maybeWhen(
          initial: () {
            return context
                .read<AddProductBloc>()
                .add(AddProductEvent.started(type: type));
          },
          orElse: () => false,
        );
    return BlocConsumer<AddProductBloc, AddProductState>(
      builder: (context, state) => state.maybeWhen(
        loading: Loading.new,
        orElse: Container.new,
        addServiceSuccess: Container.new,
        loadDataSuccess: (model, cate, providerID, sName) =>
            AddProductView(model, sName, cate, providerID),
      ),
      listener: (context, state) => state.maybeWhen(
        failure: () {
          showDialog<String>(
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
                          Icon(
                            Icons.cancel_outlined,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          AutoSizeText(
                            context.l10n.failLabel,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
          return Future.delayed(const Duration(seconds: 3), () {
            var count = 0;
            context.router.popUntil((_) => count++ == 2);
          });
        },
        addServiceSuccess: () {
          showDialog<String>(
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
                          Icon(
                            Icons.done,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                          AutoSizeText(
                            context.l10n.doneLabel,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
          return Future.delayed(const Duration(seconds: 3), () {
            var count = 0;
            context.router.popUntil((_) => count++ == 2);
          });
        },
        orElse: () => false,
      ),
    );
  }
}
