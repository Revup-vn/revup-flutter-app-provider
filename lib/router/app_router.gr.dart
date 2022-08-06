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
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:revup_provider/account/view/account_page.u.dart' as _i17;
import 'package:revup_provider/history/history_provider/view/history_provider_page.u.dart'
    as _i15;
import 'package:revup_provider/history/history_provider_detail/view/history_detail_provider_page.u.dart'
    as _i12;
import 'package:revup_provider/home/view/home_page.u.dart' as _i13;
import 'package:revup_provider/home/widgets/home_body_page.u.dart' as _i14;
import 'package:revup_provider/login/view/login_page.dart' as _i2;
import 'package:revup_provider/my_review/view/my_review_page.u.dart' as _i8;
import 'package:revup_provider/notification_provider/view/notification_provider_page.u.dart'
    as _i16;
import 'package:revup_provider/request/detail_service_request/view/detail_service_request_page.u.dart'
    as _i3;
import 'package:revup_provider/request/info_request/view/info_request_page.u.dart'
    as _i4;
import 'package:revup_provider/request/repair_completed/view/repair_completed_page.u.dart'
    as _i5;
import 'package:revup_provider/request/select_option_complete/view/select_option_complete_page.u.dart'
    as _i6;
import 'package:revup_provider/service/add-service/view/add_service_page.u.dart'
    as _i7;
import 'package:revup_provider/service/detail_service/view/detail_service_page.u.dart'
    as _i11;
import 'package:revup_provider/service/list_service/view/list_service_page.u.dart'
    as _i10;
import 'package:revup_provider/splash/splash.dart' as _i1;
import 'package:revup_provider/vendor_authentication/view/vendor_authentication_page.u.dart'
    as _i9;

class AppRouter extends _i18.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    DetailServiceRequestRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i3.DetailServiceRequestPage());
    },
    InfoRequestRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i4.InfoRequestPage());
    },
    RepairCompeleteRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i5.RepairCompeletePage());
    },
    SelectOptionCompleteRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i6.SelectOptionCompletePage());
    },
    AddServiceRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i7.AddServicePage());
    },
    MyReviewRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i8.MyReviewPage());
    },
    VendorAuthenticationRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i9.VendorAuthenticationPage());
    },
    ListServiceRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i10.ListServicePage());
    },
    DetailServiceRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i11.DetailServicePage());
    },
    HistoryProviderDetailRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i12.HistoryProviderDetailPage());
    },
    HomeRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i13.HomePage());
    },
    HomeBodyRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i14.HomeBodyPage());
    },
    HistoryProviderRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i15.HistoryProviderPage());
    },
    NotificationProviderRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i16.NotificationProviderPage());
    },
    AccountRoute.name: (routeData) {
      return _i18.AdaptivePage<void>(
          routeData: routeData, child: const _i17.AccountPage());
    }
  };

  @override
  List<_i18.RouteConfig> get routes => [
        _i18.RouteConfig(SplashRoute.name, path: '/splash-page'),
        _i18.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i18.RouteConfig(DetailServiceRequestRoute.name,
            path: '/detail-service-request-page'),
        _i18.RouteConfig(InfoRequestRoute.name, path: '/info-request-page'),
        _i18.RouteConfig(RepairCompeleteRoute.name,
            path: '/repair-compelete-page'),
        _i18.RouteConfig(SelectOptionCompleteRoute.name,
            path: '/select-option-complete-page'),
        _i18.RouteConfig(AddServiceRoute.name, path: '/add-service-page'),
        _i18.RouteConfig(MyReviewRoute.name, path: '/my-review-page'),
        _i18.RouteConfig(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page'),
        _i18.RouteConfig(ListServiceRoute.name, path: '/list-service-page'),
        _i18.RouteConfig(DetailServiceRoute.name, path: '/detail-service-page'),
        _i18.RouteConfig(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page'),
        _i18.RouteConfig(HomeRoute.name, path: '/', children: [
          _i18.RouteConfig(HomeBodyRoute.name,
              path: 'home-body-page', parent: HomeRoute.name),
          _i18.RouteConfig(HistoryProviderRoute.name,
              path: 'history-provider-page', parent: HomeRoute.name),
          _i18.RouteConfig(NotificationProviderRoute.name,
              path: 'notification-provider-page', parent: HomeRoute.name),
          _i18.RouteConfig(AccountRoute.name,
              path: 'account-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i18.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash-page');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i18.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.DetailServiceRequestPage]
class DetailServiceRequestRoute extends _i18.PageRouteInfo<void> {
  const DetailServiceRequestRoute()
      : super(DetailServiceRequestRoute.name,
            path: '/detail-service-request-page');

  static const String name = 'DetailServiceRequestRoute';
}

/// generated route for
/// [_i4.InfoRequestPage]
class InfoRequestRoute extends _i18.PageRouteInfo<void> {
  const InfoRequestRoute()
      : super(InfoRequestRoute.name, path: '/info-request-page');

  static const String name = 'InfoRequestRoute';
}

/// generated route for
/// [_i5.RepairCompeletePage]
class RepairCompeleteRoute extends _i18.PageRouteInfo<void> {
  const RepairCompeleteRoute()
      : super(RepairCompeleteRoute.name, path: '/repair-compelete-page');

  static const String name = 'RepairCompeleteRoute';
}

/// generated route for
/// [_i6.SelectOptionCompletePage]
class SelectOptionCompleteRoute extends _i18.PageRouteInfo<void> {
  const SelectOptionCompleteRoute()
      : super(SelectOptionCompleteRoute.name,
            path: '/select-option-complete-page');

  static const String name = 'SelectOptionCompleteRoute';
}

/// generated route for
/// [_i7.AddServicePage]
class AddServiceRoute extends _i18.PageRouteInfo<void> {
  const AddServiceRoute()
      : super(AddServiceRoute.name, path: '/add-service-page');

  static const String name = 'AddServiceRoute';
}

/// generated route for
/// [_i8.MyReviewPage]
class MyReviewRoute extends _i18.PageRouteInfo<void> {
  const MyReviewRoute() : super(MyReviewRoute.name, path: '/my-review-page');

  static const String name = 'MyReviewRoute';
}

/// generated route for
/// [_i9.VendorAuthenticationPage]
class VendorAuthenticationRoute extends _i18.PageRouteInfo<void> {
  const VendorAuthenticationRoute()
      : super(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page');

  static const String name = 'VendorAuthenticationRoute';
}

/// generated route for
/// [_i10.ListServicePage]
class ListServiceRoute extends _i18.PageRouteInfo<void> {
  const ListServiceRoute()
      : super(ListServiceRoute.name, path: '/list-service-page');

  static const String name = 'ListServiceRoute';
}

/// generated route for
/// [_i11.DetailServicePage]
class DetailServiceRoute extends _i18.PageRouteInfo<void> {
  const DetailServiceRoute()
      : super(DetailServiceRoute.name, path: '/detail-service-page');

  static const String name = 'DetailServiceRoute';
}

/// generated route for
/// [_i12.HistoryProviderDetailPage]
class HistoryProviderDetailRoute extends _i18.PageRouteInfo<void> {
  const HistoryProviderDetailRoute()
      : super(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page');

  static const String name = 'HistoryProviderDetailRoute';
}

/// generated route for
/// [_i13.HomePage]
class HomeRoute extends _i18.PageRouteInfo<void> {
  const HomeRoute({List<_i18.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i14.HomeBodyPage]
class HomeBodyRoute extends _i18.PageRouteInfo<void> {
  const HomeBodyRoute() : super(HomeBodyRoute.name, path: 'home-body-page');

  static const String name = 'HomeBodyRoute';
}

/// generated route for
/// [_i15.HistoryProviderPage]
class HistoryProviderRoute extends _i18.PageRouteInfo<void> {
  const HistoryProviderRoute()
      : super(HistoryProviderRoute.name, path: 'history-provider-page');

  static const String name = 'HistoryProviderRoute';
}

/// generated route for
/// [_i16.NotificationProviderPage]
class NotificationProviderRoute extends _i18.PageRouteInfo<void> {
  const NotificationProviderRoute()
      : super(NotificationProviderRoute.name,
            path: 'notification-provider-page');

  static const String name = 'NotificationProviderRoute';
}

/// generated route for
/// [_i17.AccountPage]
class AccountRoute extends _i18.PageRouteInfo<void> {
  const AccountRoute() : super(AccountRoute.name, path: 'account-page');

  static const String name = 'AccountRoute';
}
