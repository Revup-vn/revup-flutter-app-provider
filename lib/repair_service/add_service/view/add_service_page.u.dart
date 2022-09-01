import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../l10n/l10n.dart';
import '../../../shared/widgets/loading.u.dart';
import '../bloc/add_service_bloc.dart';
import '../bloc/dropdown_list_bloc.dart';
import '../bloc/upload_image_bloc.dart';
import 'add_service_view.u.dart';

class AddServicePage extends StatelessWidget {
  const AddServicePage(
    this.providerID, {
    super.key,
  });
  final String providerID;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              AddServiceBloc(providerID, context.read(), context.read())
                ..add(
                  const AddServiceEvent.started(),
                ),
        ),
        BlocProvider(
          create: (context) => UploadImageBloc(ImagePicker(), context.read()),
        ),
        BlocProvider(
          create: (context) => DropdownListBloc(),
        ),
      ],
      child: BlocConsumer<AddServiceBloc, AddServiceState>(
        builder: (context, state) => state.maybeMap(
          loading: (value) => const Loading(),
          initial: (value) => AddServiceView(),
          orElse: Container.new,
        ),
        listener: (context, state) => state.maybeWhen(
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
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
                              Icons.cancel,
                              color: Theme.of(context).colorScheme.onTertiary,
                            ),
                            AutoSizeText(
                              context.l10n.failLabel,
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
      ),
    );
  }
}
