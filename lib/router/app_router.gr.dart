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

import 'package:revup_provider/login/view/login_page.dart' as _i2;
import 'package:revup_provider/splash/splash.dart' as _i1;

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
          routeData: routeData, child: const _i4.InfoRequestPage());
    },
    RepairCompeleteRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i5.RepairCompeletePage());
    },
    SelectOptionCompleteRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i6.SelectOptionCompletePage());
    },
    AddServiceRoute.name: (routeData) {
      return _i8.AdaptivePage<void>(
          routeData: routeData, child: const _i7.AddServicePage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashRoute.name, path: '/splash-page'),
        _i8.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i8.RouteConfig(DetailServiceRequestRoute.name,
            path: '/detail-service-request-page'),
        _i8.RouteConfig(InfoRequestRoute.name, path: '/info-request-page'),
        _i8.RouteConfig(RepairCompeleteRoute.name,
            path: '/repair-compelete-page'),
        _i8.RouteConfig(SelectOptionCompleteRoute.name,
            path: '/select-option-complete-page'),
        _i8.RouteConfig(AddServiceRoute.name, path: '/')
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
/// [_i4.InfoRequestPage]
class InfoRequestRoute extends _i8.PageRouteInfo<void> {
  const InfoRequestRoute()
      : super(InfoRequestRoute.name, path: '/info-request-page');

  static const String name = 'InfoRequestRoute';
}

/// generated route for
/// [_i5.RepairCompeletePage]
class RepairCompeleteRoute extends _i8.PageRouteInfo<void> {
  const RepairCompeleteRoute()
      : super(RepairCompeleteRoute.name, path: '/repair-compelete-page');

  static const String name = 'RepairCompeleteRoute';
}

/// generated route for
/// [_i6.SelectOptionCompletePage]
class SelectOptionCompleteRoute extends _i8.PageRouteInfo<void> {
  const SelectOptionCompleteRoute()
      : super(SelectOptionCompleteRoute.name,
            path: '/select-option-complete-page');

  static const String name = 'SelectOptionCompleteRoute';
}

/// generated route for
/// [_i7.AddServicePage]
class AddServiceRoute extends _i8.PageRouteInfo<void> {
  const AddServiceRoute() : super(AddServiceRoute.name, path: '/');

  static const String name = 'AddServiceRoute';
}
