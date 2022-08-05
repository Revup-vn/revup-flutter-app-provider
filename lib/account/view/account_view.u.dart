import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../router/app_router.gr.dart';
import '../model/user_model.dart';
import '../widgets/account_item.dart';
import '../widgets/avatar.dart';

class AccountView extends StatelessWidget {
  const AccountView({
    super.key,
    required this.user,
    required this.model,
  });

  final UserModel user;
  final AppUser model;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Avatar(
                  user: user,
                  callback: () {
                    // TODO(namngoc231): Go to photo selection method
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                AutoSizeText(
                  user.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 6,
                ),
                InkWell(
                  onTap: () {
                    context.router.push(
                      const MyReviewRoute(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AutoSizeText(
                        '4.5',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ) ??
                                const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      SizedBox(
                        width: 30,
                        child: Icon(
                          Icons.star,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    AutoSizeText(
                      l10n.accountLabel,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                AccountItem(
                  accountName: l10n.serviceAccountLabel,
                  accountIcon: const Icon(Icons.home_repair_service),
                  callback: () {
                    // TODO(namngoc231): Go to Service
                    context.router.push(
                      const ListServiceRoute(),
                    );
                  },
                ),
                AccountItem(
                  accountName: l10n.editProfileLabel,
                  accountIcon: const Icon(Icons.portrait),
                  callback: () {
                    // TODO(namngoc231): Go to update profile
                    context.router.push(
                      const VendorAuthenticationRoute(),
                    );
                  },
                ),
                AccountItem(
                  accountName: l10n.paymentLabel,
                  accountIcon: const Icon(Icons.payment),
                  callback: () {
                    // TODO(namngoc231): Go to payment
                  },
                ),
                AccountItem(
                  accountName: l10n.organizationLabel,
                  accountIcon: const Icon(Icons.business),
                  callback: () {
                    // TODO(namngoc231): Go to Organization account
                  },
                ),
                AccountItem(
                  accountName: l10n.changeLanguageLabel,
                  accountIcon: const Icon(
                    IconData(0xe366, fontFamily: 'MaterialIcons'),
                  ),
                  callback: () {
                    // TODO(namngoc231): Go to Change Language
                  },
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    AutoSizeText(
                      l10n.guideAndSupportLabel,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                AccountItem(
                  accountName: l10n.faqsLabel,
                  accountIcon: const Icon(Icons.quiz),
                  callback: () {
                    // TODO(namngoc231): Go to faq
                  },
                ),
                AccountItem(
                  accountName: l10n.termsOfServiceLabel,
                  accountIcon: const Icon(Icons.fact_check),
                  callback: () {
                    // TODO(namngoc231): Go to term of service
                  },
                ),
                AccountItem(
                  accountName: l10n.aboutUsLabel,
                  accountIcon: const Icon(Icons.people),
                  callback: () {
                    // TODO(namngoc231): Go to about us
                  },
                ),
                AccountItem(
                  accountName: l10n.logoutLabel,
                  accountIcon: const Icon(Icons.logout),
                  callback: () {
                    // TODO(namngoc231): Go to Logout
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
