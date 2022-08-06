import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../router/app_router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //final AppUser user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = AppUser.consumer(
      uuid: '1a',
      firstName: 'Nam',
      lastName: 'Ngoc',
      phone: 'XXX-XXX-XXXX',
      dob: DateTime.now(),
      addr: 'Ninh Binh',
      email: 'huyxam@huyxam.cm',
      active: true,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280s.jpg',
      createdTime: DateTime.now(),
      lastUpdatedTime: DateTime.now(),
      vac: const VideoCallAccount(
        id: '',
        username: '',
        pwd: '',
        email: '',
      ),
    );

    return RepositoryProvider.value(
      value: user,
      child: AutoTabsScaffold(
        routes: const [
          HomeBodyRoute(),
          HistoryProviderRoute(),
          NotificationProviderRoute(),
          AccountRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: l10n.homeLabel,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.restore),
                label: l10n.activateLabel,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.notifications),
                label: l10n.notificationLabel,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.account_circle),
                label: l10n.accountLabel,
              ),
            ],
          );
        },
      ),
    );
  }
}
