import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/l10n.dart';
import '../../../shared/widgets/loading.u.dart';
import '../bloc/detail_service_bloc.dart';
import 'detail_service_view.u.dart';

class DetailServiceBuilder extends StatelessWidget {
  const DetailServiceBuilder(this.providerID, {super.key});
  final String providerID;
  @override
  Widget build(BuildContext context) {
    context.watch<DetailServiceBloc>().state.maybeWhen(
          initial: () {
            return context
                .read<DetailServiceBloc>()
                .add(const DetailServiceEvent.started());
          },
          orElse: () => false,
        );
    return BlocConsumer<DetailServiceBloc, DetailServiceState>(
      listener: (context, state) => state.maybeWhen(
        orElse: () => false,
        failure: () {
          showFailureDialog(context);
          return Future.delayed(const Duration(seconds: 3), () {
            var count = 0;
            context.router.popUntil((_) => count++ == 2);
          });
        },
      ),
      builder: (context, state) => state.when(
        initial: Container.new,
        loadDataSuccess: (rpService, rpProduct, cate) => DetailServiceView(
          service: rpService,
          listProduct: rpProduct,
          providerID: providerID,
          cate: cate,
        ),
        loading: Loading.new,
        failure: Container.new,
      ),
    );
  }

  Future<String?> showFailureDialog(BuildContext context) {
    return showDialog<String>(
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
                      Icons.cancel,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    AutoSizeText(
                      context.l10n.failLabel,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
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
  }
}
