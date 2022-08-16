import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/loading.u.dart';
import '../../../home.dart';
import '../widgets/acoount_content.u.dart';

class AccountView extends StatelessWidget {
  const AccountView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.watch<AccountBloc>().state.maybeWhen(
          initial: () {
            return context
                .read<AccountBloc>()
                .add(const AccountEvent.started());
          },
          orElse: () => false,
        );
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) => state.when(
        initial: Container.new,
        loading: Loading.new,
        failure: Loading.new,
        success: (aUser, rating, newImgUrl) => AccountContent(
          user: aUser,
          rating: rating,
          newImgPhoto: newImgUrl,
        ),
      ),
    );
  }
}
