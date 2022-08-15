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

import 'dart:async' as _i14;

import 'package:flutter/material.dart' as _i13;

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:revup_core/core.dart' as _i15;

import 'package:revup_provider/home/home.dart' as _i7;
import 'package:revup_provider/login/view/login_page.u.dart' as _i2;
import 'package:revup_provider/my_review/my_review.dart' as _i5;
import 'package:revup_provider/otp/view/otp_page.u.dart' as _i9;
import 'package:revup_provider/repair_service/repair_service.dart' as _i4;
import 'package:revup_provider/request/modules/modules.dart' as _i3;
import 'package:revup_provider/signup/view/signup_page.u.dart' as _i8;
import 'package:revup_provider/splash/splash.dart' as _i1;

import 'package:revup_provider/login/login_enter_phone/view/login_enter_phone_number_page.u.dart'
    as _i10;
import 'package:revup_provider/repair_service/update_service/view/view.dart'
    as _i11;
import 'package:revup_provider/vendor_authentication/vender_authentication.dart'
    as _i6;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i12.AdaptivePage<void>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i12.AdaptivePage<void>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    DetailServiceRequestRoute.name: (routeData) {
      return _i12.AdaptivePage<void>(
          routeData: routeData,
          child: const _i3.DetailServiceRequestPage(),
          maintainState: false);
    },
    InfoRequestRoute.name: (routeData) {
      return _i12.AdaptivePage<void>(
          routeData: routeData, child: const _i3.InfoRequestPage());
    },
    RepairCompleteRoute.name: (routeData) {
      return _i12.AdaptivePage<void>(
          routeData: routeData, child: const _i3.RepairCompletePage());
    },
    SelectOptionCompleteRoute.name: (routeData) {
      return _i12.AdaptivePage<void>(
          routeData: routeData, child: const _i3.SelectOptionCompletePage());
    },
    AddServiceRoute.name: (routeData) {
      final args = routeData.argsAs<AddServiceRouteArgs>();
      return _i12.AdaptivePage<void>(
          routeData: routeData,
          child: _i4.AddServicePage(args.providerID, key: args.key));
    },
    MyReviewRoute.name: (routeData) {
      final args = routeData.argsAs<MyReviewRouteArgs>();
      return _i12.AdaptivePage<void>(
          routeData: routeData,
          child: _i5.MyReviewPage(args.providerID, key: args.key));
    },
    VendorAuthenticationRoute.name: (routeData) {
      return _i12.AdaptivePage<void>(
          routeData: routeData, child: const _i6.VendorAuthenticationPage());
    },
    ListServiceRoute.name: (routeData) {
      final args = routeData.argsAs<ListServiceRouteArgs>();
      return _i12.AdaptivePage<void>(
          routeData: routeData,
          child: _i4.ListServicePage(args.providerID, key: args.key),
          maintainState: false);
    },
    DetailServiceRoute.name: (routeData) {
      final args = routeData.argsAs<DetailServiceRouteArgs>();
      return _i12.AdaptivePage<void>(
          routeData: routeData,
          child: _i4.DetailServicePage(
              args.providerID, args.serviceName, args.category,
              key: args.key));
    },
    HistoryProviderDetailRoute.name: (routeData) {
      return _i12.AdaptivePage<void>(
          routeData: routeData, child: const _i7.HistoryProviderDetailPage());
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>();
      return _i12.AdaptivePage<void>(
          routeData: routeData,
          child: _i8.SignupPage(args.completer, args.phoneNumber, args.photoURL,
              args.uid, args.email,
              key: args.key));
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return _i12.AdaptivePage<void>(
          routeData: routeData,
          child: _i9.OTPPage(args.phoneNumber, args.completer, key: args.key));
    },
    LoginEnterPhoneRoute.name: (routeData) {
      final args = routeData.argsAs<LoginEnterPhoneRouteArgs>();
      return _i12.AdaptivePage<void>(
          routeData: routeData,
          child: _i10.LoginEnterPhonePage(args.completer, args.phoneNumber,
              args.photoURL, args.uid, args.email,
              key: args.key));
    },
    UpdateServiceRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateServiceRouteArgs>();
      return _i12.AdaptivePage<void>(
          routeData: routeData,
          child: _i11.UpdateServicePage(
              args.providerID, args.category, args.sName,
              key: args.key));
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i12.AdaptivePage<void>(
          routeData: routeData, child: _i7.HomePage(args.user, key: args.key));
    },
    HomePrimaryRoute.name: (routeData) {
      final args = routeData.argsAs<HomePrimaryRouteArgs>();
      return _i12.AdaptivePage<void>(
          routeData: routeData,
          child: _i7.HomePrimaryPage(args.user, key: args.key));
    },
    HistoryProviderRoute.name: (routeData) {
      return _i12.AdaptivePage<void>(
          routeData: routeData, child: const _i7.HistoryProviderPage());
    },
    NotificationProviderRoute.name: (routeData) {
      return _i12.AdaptivePage<void>(
          routeData: routeData, child: const _i7.NotificationProviderPage());
    },
    AccountRoute.name: (routeData) {
      final args = routeData.argsAs<AccountRouteArgs>();
      return _i12.AdaptivePage<void>(
          routeData: routeData,
          child: _i7.AccountPage(args.user, key: args.key));
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(SplashRoute.name, path: '/'),
        _i12.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i12.RouteConfig(DetailServiceRequestRoute.name,
            path: '/detail-service-request-page'),
        _i12.RouteConfig(InfoRequestRoute.name, path: '/info-request-page'),
        _i12.RouteConfig(RepairCompleteRoute.name,
            path: '/repair-complete-page'),
        _i12.RouteConfig(SelectOptionCompleteRoute.name,
            path: '/select-option-complete-page'),
        _i12.RouteConfig(AddServiceRoute.name, path: '/add-service-page'),
        _i12.RouteConfig(MyReviewRoute.name, path: '/my-review-page'),
        _i12.RouteConfig(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page'),
        _i12.RouteConfig(ListServiceRoute.name, path: '/list-service-page'),
        _i12.RouteConfig(DetailServiceRoute.name, path: '/detail-service-page'),
        _i12.RouteConfig(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page'),
        _i12.RouteConfig(SignupRoute.name, path: '/signup-page'),
        _i12.RouteConfig(OTPRoute.name, path: '/o-tp-page'),
        _i12.RouteConfig(LoginEnterPhoneRoute.name,
            path: '/login-enter-phone-page'),
        _i12.RouteConfig(UpdateServiceRoute.name, path: '/update-service-page'),
        _i12.RouteConfig(HomeRoute.name, path: '/home-page', children: [
          _i12.RouteConfig(HomePrimaryRoute.name,
              path: 'home-primary-page', parent: HomeRoute.name),
          _i12.RouteConfig(HistoryProviderRoute.name,
              path: 'history-provider-page', parent: HomeRoute.name),
          _i12.RouteConfig(NotificationProviderRoute.name,
              path: 'notification-provider-page', parent: HomeRoute.name),
          _i12.RouteConfig(AccountRoute.name,
              path: 'account-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.DetailServiceRequestPage]
class DetailServiceRequestRoute extends _i12.PageRouteInfo<void> {
  const DetailServiceRequestRoute()
      : super(DetailServiceRequestRoute.name,
            path: '/detail-service-request-page');

  static const String name = 'DetailServiceRequestRoute';
}

/// generated route for
/// [_i3.InfoRequestPage]
class InfoRequestRoute extends _i12.PageRouteInfo<void> {
  const InfoRequestRoute()
      : super(InfoRequestRoute.name, path: '/info-request-page');

  static const String name = 'InfoRequestRoute';
}

/// generated route for
/// [_i3.RepairCompletePage]
class RepairCompleteRoute extends _i12.PageRouteInfo<void> {
  const RepairCompleteRoute()
      : super(RepairCompleteRoute.name, path: '/repair-complete-page');

  static const String name = 'RepairCompleteRoute';
}

/// generated route for
/// [_i3.SelectOptionCompletePage]
class SelectOptionCompleteRoute extends _i12.PageRouteInfo<void> {
  const SelectOptionCompleteRoute()
      : super(SelectOptionCompleteRoute.name,
            path: '/select-option-complete-page');

  static const String name = 'SelectOptionCompleteRoute';
}

/// generated route for
/// [_i4.AddServicePage]
class AddServiceRoute extends _i12.PageRouteInfo<AddServiceRouteArgs> {
  AddServiceRoute({required String providerID, _i13.Key? key})
      : super(AddServiceRoute.name,
            path: '/add-service-page',
            args: AddServiceRouteArgs(providerID: providerID, key: key));

  static const String name = 'AddServiceRoute';
}

class AddServiceRouteArgs {
  const AddServiceRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i13.Key? key;

  @override
  String toString() {
    return 'AddServiceRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i5.MyReviewPage]
class MyReviewRoute extends _i12.PageRouteInfo<MyReviewRouteArgs> {
  MyReviewRoute({required String providerID, _i13.Key? key})
      : super(MyReviewRoute.name,
            path: '/my-review-page',
            args: MyReviewRouteArgs(providerID: providerID, key: key));

  static const String name = 'MyReviewRoute';
}

class MyReviewRouteArgs {
  const MyReviewRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i13.Key? key;

  @override
  String toString() {
    return 'MyReviewRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i6.VendorAuthenticationPage]
class VendorAuthenticationRoute extends _i12.PageRouteInfo<void> {
  const VendorAuthenticationRoute()
      : super(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page');

  static const String name = 'VendorAuthenticationRoute';
}

/// generated route for
/// [_i4.ListServicePage]
class ListServiceRoute extends _i12.PageRouteInfo<ListServiceRouteArgs> {
  ListServiceRoute({required String providerID, _i13.Key? key})
      : super(ListServiceRoute.name,
            path: '/list-service-page',
            args: ListServiceRouteArgs(providerID: providerID, key: key));

  static const String name = 'ListServiceRoute';
}

class ListServiceRouteArgs {
  const ListServiceRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i13.Key? key;

  @override
  String toString() {
    return 'ListServiceRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i4.DetailServicePage]
class DetailServiceRoute extends _i12.PageRouteInfo<DetailServiceRouteArgs> {
  DetailServiceRoute(
      {required String providerID,
      required String serviceName,
      required String category,
      _i13.Key? key})
      : super(DetailServiceRoute.name,
            path: '/detail-service-page',
            args: DetailServiceRouteArgs(
                providerID: providerID,
                serviceName: serviceName,
                category: category,
                key: key));

  static const String name = 'DetailServiceRoute';
}

class DetailServiceRouteArgs {
  const DetailServiceRouteArgs(
      {required this.providerID,
      required this.serviceName,
      required this.category,
      this.key});

  final String providerID;

  final String serviceName;

  final String category;

  final _i13.Key? key;

  @override
  String toString() {
    return 'DetailServiceRouteArgs{providerID: $providerID, serviceName: $serviceName, category: $category, key: $key}';
  }
}

/// generated route for
/// [_i7.HistoryProviderDetailPage]
class HistoryProviderDetailRoute extends _i12.PageRouteInfo<void> {
  const HistoryProviderDetailRoute()
      : super(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page');

  static const String name = 'HistoryProviderDetailRoute';
}

/// generated route for
/// [_i8.SignupPage]
class SignupRoute extends _i12.PageRouteInfo<SignupRouteArgs> {
  SignupRoute(
      {required _i14.Completer<_i15.AppUser> completer,
      required String phoneNumber,
      required String photoURL,
      required String uid,
      required String email,
      _i13.Key? key})
      : super(SignupRoute.name,
            path: '/signup-page',
            args: SignupRouteArgs(
                completer: completer,
                phoneNumber: phoneNumber,
                photoURL: photoURL,
                uid: uid,
                email: email,
                key: key));

  static const String name = 'SignupRoute';
}

class SignupRouteArgs {
  const SignupRouteArgs(
      {required this.completer,
      required this.phoneNumber,
      required this.photoURL,
      required this.uid,
      required this.email,
      this.key});

  final _i14.Completer<_i15.AppUser> completer;

  final String phoneNumber;

  final String photoURL;

  final String uid;

  final String email;

  final _i13.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{completer: $completer, phoneNumber: $phoneNumber, photoURL: $photoURL, uid: $uid, email: $email, key: $key}';
  }
}

/// generated route for
/// [_i9.OTPPage]
class OTPRoute extends _i12.PageRouteInfo<OTPRouteArgs> {
  OTPRoute(
      {required String phoneNumber,
      required _i14.Completer<String> completer,
      _i13.Key? key})
      : super(OTPRoute.name,
            path: '/o-tp-page',
            args: OTPRouteArgs(
                phoneNumber: phoneNumber, completer: completer, key: key));

  static const String name = 'OTPRoute';
}

class OTPRouteArgs {
  const OTPRouteArgs(
      {required this.phoneNumber, required this.completer, this.key});

  final String phoneNumber;

  final _i14.Completer<String> completer;

  final _i13.Key? key;

  @override
  String toString() {
    return 'OTPRouteArgs{phoneNumber: $phoneNumber, completer: $completer, key: $key}';
  }
}

/// generated route for
/// [_i10.LoginEnterPhonePage]
class LoginEnterPhoneRoute
    extends _i12.PageRouteInfo<LoginEnterPhoneRouteArgs> {
  LoginEnterPhoneRoute(
      {required _i14.Completer<_i15.AppUser> completer,
      required String phoneNumber,
      required String photoURL,
      required String uid,
      required String email,
      _i13.Key? key})
      : super(LoginEnterPhoneRoute.name,
            path: '/login-enter-phone-page',
            args: LoginEnterPhoneRouteArgs(
                completer: completer,
                phoneNumber: phoneNumber,
                photoURL: photoURL,
                uid: uid,
                email: email,
                key: key));

  static const String name = 'LoginEnterPhoneRoute';
}

class LoginEnterPhoneRouteArgs {
  const LoginEnterPhoneRouteArgs(
      {required this.completer,
      required this.phoneNumber,
      required this.photoURL,
      required this.uid,
      required this.email,
      this.key});

  final _i14.Completer<_i15.AppUser> completer;

  final String phoneNumber;

  final String photoURL;

  final String uid;

  final String email;

  final _i13.Key? key;

  @override
  String toString() {
    return 'LoginEnterPhoneRouteArgs{completer: $completer, phoneNumber: $phoneNumber, photoURL: $photoURL, uid: $uid, email: $email, key: $key}';
  }
}

/// generated route for
/// [_i11.UpdateServicePage]
class UpdateServiceRoute extends _i12.PageRouteInfo<UpdateServiceRouteArgs> {
  UpdateServiceRoute(
      {required String providerID,
      required String category,
      required String sName,
      _i13.Key? key})
      : super(UpdateServiceRoute.name,
            path: '/update-service-page',
            args: UpdateServiceRouteArgs(
                providerID: providerID,
                category: category,
                sName: sName,
                key: key));

  static const String name = 'UpdateServiceRoute';
}

class UpdateServiceRouteArgs {
  const UpdateServiceRouteArgs(
      {required this.providerID,
      required this.category,
      required this.sName,
      this.key});

  final String providerID;

  final String category;

  final String sName;

  final _i13.Key? key;

  @override
  String toString() {
    return 'UpdateServiceRouteArgs{providerID: $providerID, category: $category, sName: $sName, key: $key}';
  }
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i12.PageRouteInfo<HomeRouteArgs> {
  HomeRoute(
      {required _i15.AppUser user,
      _i13.Key? key,
      List<_i12.PageRouteInfo>? children})
      : super(HomeRoute.name,
            path: '/home-page',
            args: HomeRouteArgs(user: user, key: key),
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({required this.user, this.key});

  final _i15.AppUser user;

  final _i13.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i7.HomePrimaryPage]
class HomePrimaryRoute extends _i12.PageRouteInfo<HomePrimaryRouteArgs> {
  HomePrimaryRoute({required _i15.AppUser user, _i13.Key? key})
      : super(HomePrimaryRoute.name,
            path: 'home-primary-page',
            args: HomePrimaryRouteArgs(user: user, key: key));

  static const String name = 'HomePrimaryRoute';
}

class HomePrimaryRouteArgs {
  const HomePrimaryRouteArgs({required this.user, this.key});

  final _i15.AppUser user;

  final _i13.Key? key;

  @override
  String toString() {
    return 'HomePrimaryRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i7.HistoryProviderPage]
class HistoryProviderRoute extends _i12.PageRouteInfo<void> {
  const HistoryProviderRoute()
      : super(HistoryProviderRoute.name, path: 'history-provider-page');

  static const String name = 'HistoryProviderRoute';
}

/// generated route for
/// [_i7.NotificationProviderPage]
class NotificationProviderRoute extends _i12.PageRouteInfo<void> {
  const NotificationProviderRoute()
      : super(NotificationProviderRoute.name,
            path: 'notification-provider-page');

  static const String name = 'NotificationProviderRoute';
}

/// generated route for
/// [_i7.AccountPage]
class AccountRoute extends _i12.PageRouteInfo<AccountRouteArgs> {
  AccountRoute({required _i15.AppUser user, _i13.Key? key})
      : super(AccountRoute.name,
            path: 'account-page', args: AccountRouteArgs(user: user, key: key));

  static const String name = 'AccountRoute';
}

class AccountRouteArgs {
  const AccountRouteArgs({required this.user, this.key});

  final _i15.AppUser user;

  final _i13.Key? key;

  @override
  String toString() {
    return 'AccountRouteArgs{user: $user, key: $key}';
  }
}
