import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              rating: rating,
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
              accountName: l10n.serviceAccountLabel,
              accountIcon: const Icon(Icons.home_repair_service),
              callback: () {
                // TODO(namngoc231): Go to Service
                context.router.push(
                  ListServiceRoute(providerID: user.uuid),
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
