// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:flutter/material.dart' as _i9;

import 'package:auto_route/auto_route.dart' as _i8;

import 'package:revup_provider/home/home.dart' as _i7;
import 'package:revup_provider/login/view/login_page.dart' as _i2;
import 'package:revup_provider/my_review/my_review.dart' as _i5;
import 'package:revup_provider/repair_service/repair_service.dart' as _i4;
import 'package:revup_provider/request/modules/modules.dart' as _i3;
import 'package:revup_provider/splash/splash.dart' as _i1;

import 'package:revup_provider/vendor_authentication/vender_authentication.dart'
    as _i6;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    DetailServiceRequestRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i3.DetailServiceRequestPage());
    },
    InfoRequestRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i3.InfoRequestPage());
    },
    RepairCompleteRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i3.RepairCompletePage());
    },
    SelectOptionCompleteRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i3.SelectOptionCompletePage());
    },
    AddServiceRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i4.AddServicePage());
    },
    MyReviewRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i5.MyReviewPage());
    },
    VendorAuthenticationRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i6.VendorAuthenticationPage());
    },
    ListServiceRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i4.ListServicePage());
    },
    DetailServiceRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i4.DetailServicePage());
    },
    HistoryProviderDetailRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i7.HistoryProviderDetailPage());
    },
    HomeRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i7.HomePage());
    },
    HomePrimaryRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i7.HomePrimaryPage());
    },
    HistoryProviderRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i7.HistoryProviderPage());
    },
    NotificationProviderRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i7.NotificationProviderPage());
    },
    AccountRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i7.AccountPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashRoute.name, path: '/splash-page'),
        _i8.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i8.RouteConfig(DetailServiceRequestRoute.name,
            path: '/detail-service-request-page'),
        _i8.RouteConfig(InfoRequestRoute.name, path: '/info-request-page'),
        _i8.RouteConfig(RepairCompleteRoute.name,
            path: '/repair-complete-page'),
        _i8.RouteConfig(SelectOptionCompleteRoute.name,
            path: '/select-option-complete-page'),
        _i8.RouteConfig(AddServiceRoute.name, path: '/add-service-page'),
        _i8.RouteConfig(MyReviewRoute.name, path: '/my-review-page'),
        _i8.RouteConfig(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page'),
        _i8.RouteConfig(ListServiceRoute.name, path: '/list-service-page'),
        _i8.RouteConfig(DetailServiceRoute.name, path: '/detail-service-page'),
        _i8.RouteConfig(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page'),
        _i8.RouteConfig(HomeRoute.name, path: '/', children: [
          _i8.RouteConfig(HomePrimaryRoute.name,
              path: 'home-primary-page', parent: HomeRoute.name),
          _i8.RouteConfig(HistoryProviderRoute.name,
              path: 'history-provider-page', parent: HomeRoute.name),
          _i8.RouteConfig(NotificationProviderRoute.name,
              path: 'notification-provider-page', parent: HomeRoute.name),
          _i8.RouteConfig(AccountRoute.name,
              path: 'account-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash-page');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.DetailServiceRequestPage]
class DetailServiceRequestRoute extends _i8.PageRouteInfo<void> {
  const DetailServiceRequestRoute()
      : super(DetailServiceRequestRoute.name,
            path: '/detail-service-request-page');

  static const String name = 'DetailServiceRequestRoute';
}

/// generated route for
/// [_i3.InfoRequestPage]
class InfoRequestRoute extends _i8.PageRouteInfo<void> {
  const InfoRequestRoute()
      : super(InfoRequestRoute.name, path: '/info-request-page');

  static const String name = 'InfoRequestRoute';
}

/// generated route for
/// [_i3.RepairCompletePage]
class RepairCompleteRoute extends _i8.PageRouteInfo<void> {
  const RepairCompleteRoute()
      : super(RepairCompleteRoute.name, path: '/repair-complete-page');

  static const String name = 'RepairCompleteRoute';
}

/// generated route for
/// [_i3.SelectOptionCompletePage]
class SelectOptionCompleteRoute extends _i8.PageRouteInfo<void> {
  const SelectOptionCompleteRoute()
      : super(SelectOptionCompleteRoute.name,
            path: '/select-option-complete-page');

  static const String name = 'SelectOptionCompleteRoute';
}

/// generated route for
/// [_i4.AddServicePage]
class AddServiceRoute extends _i8.PageRouteInfo<void> {
  const AddServiceRoute()
      : super(AddServiceRoute.name, path: '/add-service-page');

  static const String name = 'AddServiceRoute';
}

/// generated route for
/// [_i5.MyReviewPage]
class MyReviewRoute extends _i8.PageRouteInfo<void> {
  const MyReviewRoute() : super(MyReviewRoute.name, path: '/my-review-page');

  static const String name = 'MyReviewRoute';
}

/// generated route for
/// [_i6.VendorAuthenticationPage]
class VendorAuthenticationRoute extends _i8.PageRouteInfo<void> {
  const VendorAuthenticationRoute()
      : super(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page');

  static const String name = 'VendorAuthenticationRoute';
}

/// generated route for
/// [_i4.ListServicePage]
class ListServiceRoute extends _i8.PageRouteInfo<void> {
  const ListServiceRoute()
      : super(ListServiceRoute.name, path: '/list-service-page');

  static const String name = 'ListServiceRoute';
}

/// generated route for
/// [_i4.DetailServicePage]
class DetailServiceRoute extends _i8.PageRouteInfo<void> {
  const DetailServiceRoute()
      : super(DetailServiceRoute.name, path: '/detail-service-page');

  static const String name = 'DetailServiceRoute';
}

/// generated route for
/// [_i7.HistoryProviderDetailPage]
class HistoryProviderDetailRoute extends _i8.PageRouteInfo<void> {
  const HistoryProviderDetailRoute()
      : super(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page');

  static const String name = 'HistoryProviderDetailRoute';
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.HomePrimaryPage]
class HomePrimaryRoute extends _i8.PageRouteInfo<void> {
  const HomePrimaryRoute()
      : super(HomePrimaryRoute.name, path: 'home-primary-page');

  static const String name = 'HomePrimaryRoute';
}

/// generated route for
/// [_i7.HistoryProviderPage]
class HistoryProviderRoute extends _i8.PageRouteInfo<void> {
  const HistoryProviderRoute()
      : super(HistoryProviderRoute.name, path: 'history-provider-page');

  static const String name = 'HistoryProviderRoute';
}

/// generated route for
/// [_i7.NotificationProviderPage]
class NotificationProviderRoute extends _i8.PageRouteInfo<void> {
  const NotificationProviderRoute()
      : super(NotificationProviderRoute.name,
            path: 'notification-provider-page');

  static const String name = 'NotificationProviderRoute';
}

/// generated route for
/// [_i7.AccountPage]
class AccountRoute extends _i8.PageRouteInfo<void> {
  const AccountRoute() : super(AccountRoute.name, path: 'account-page');

  static const String name = 'AccountRoute';
}
