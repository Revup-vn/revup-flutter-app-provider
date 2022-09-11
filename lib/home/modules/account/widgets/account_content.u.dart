import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../../router/router.dart';
import '../../../../shared/shared.dart';
import '../../../home.dart';

class AccountContent extends StatelessWidget {
  const AccountContent({
    super.key,
    required this.user,
    required this.rating,
    required this.newImgPhoto,
  });
  final AppUser user;
  final double rating;
  final String newImgPhoto;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Avatar(
              localImg: File(''),
              userName: '${user.firstName} ${user.lastName}',
              urlImage: newImgPhoto.isEmpty ? user.avatarUrl : newImgPhoto,
              callback: () {
                _showModalButtonSheet(context);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            AutoSizeText(
              '${user.firstName} ${user.lastName}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 6,
            ),
            OverviewRating(
              onTap: () {
                context.router.push(
                  MyReviewRoute(providerID: user.uuid),
                );
              },
              rating: double.parse(rating.toStringAsFixed(1)),
            ),
            const SizedBox(
              height: 32,
              width: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: AutoSizeText(
                l10n.accountLabel,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            AccountItem(
              accountName: l10n.analyticLabel,
              accountIcon: const Icon(Icons.analytics_outlined),
              callback: () {
                context.router.push(
                  AnalyticsRoute(providerID: user.uuid),
                );
              },
            ),
            AccountItem(
              accountName: l10n.serviceAccountLabel,
              accountIcon: const Icon(Icons.home_repair_service),
              callback: () {
                context.router.push(
                  ListServiceRoute(providerID: user.uuid),
                );
              },
            ),
            AccountItem(
              accountName: l10n.editProfileLabel,
              accountIcon: const Icon(Icons.portrait),
              callback: () {
                context.router.push(
                  VendorAuthenticationRoute(user: user),
                );
              },
            ),
            AccountItem(
              accountName: l10n.paymentLabel,
              accountIcon: const Icon(Icons.wallet),
              callback: () => context.showInfoBar<void>(
                content: Text(context.l10n.notSupportLabel),
              ),
            ),
            AccountItem(
              accountName: l10n.organizationLabel,
              accountIcon: const Icon(Icons.business),
              callback: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: AutoSizeText(context.l10n.notSupportLabel),
                ),
              ),
            ),
            AccountItem(
              accountName: l10n.changeLanguageLabel,
              accountIcon: const Icon(
                IconData(0xe366, fontFamily: 'MaterialIcons'),
              ),
              callback: () {
                context.router.push(const ChangeLanguageRoute());
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              width: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: AutoSizeText(
                l10n.guideAndSupportLabel,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            AccountItem(
              accountName: l10n.faqsLabel,
              accountIcon: const Icon(Icons.quiz),
              callback: () {
                context.router.push(
                  const FAQsRoute(),
                );
              },
            ),
            AccountItem(
              accountName: l10n.termsOfServiceLabel,
              accountIcon: const Icon(Icons.fact_check),
              callback: () {
                context.router.push(
                  const TermsPrivacyRoute(),
                );
              },
            ),
            AccountItem(
              accountName: l10n.aboutUsLabel,
              accountIcon: const Icon(Icons.people),
              callback: () {
                context.router.push(
                  const AboutUsRoute(),
                );
              },
            ),
            AccountItem(
              accountName: l10n.logoutLabel,
              accountIcon: const Icon(Icons.logout),
              callback: () async {
                final bloc = context.read<AuthenticateBloc>();
                final boxAuthType = await Hive.openBox<dynamic>('authType');
                final authType = boxAuthType.get('auth', defaultValue: '')
                    as Map<String, dynamic>;
                if (authType.isNotEmpty) {
                  bloc.add(
                    AuthenticateEvent.signOut(
                      authType: AuthType.fromJson(authType),
                    ),
                  );
                  await context.router.popAndPush(const LoginRoute());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showModalButtonSheet(
    BuildContext context,
  ) {
    final bloc = context.read<AccountBloc>();
    showMaterialModalBottomSheet<Widget>(
      context: context,
      builder: (context) => SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: AutoSizeText(context.l10n.imageFromGalleryLabel),
              leading: const Icon(Icons.photo_library_rounded),
              onTap: () async {
                bloc.add(
                  const AccountEvent.imageUploadSelected(
                    source: ImageSource.gallery,
                  ),
                );
                await context.router.pop();
              },
            ),
            ListTile(
              title: AutoSizeText(context.l10n.photoWithCameraLabel),
              leading: const Icon(Icons.camera_alt_rounded),
              onTap: () async {
                bloc.add(
                  const AccountEvent.imageUploadSelected(
                    source: ImageSource.camera,
                  ),
                );
                await context.router.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
