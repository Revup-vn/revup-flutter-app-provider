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
import 'dart:async' as _i19;

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:dartz/dartz.dart' as _i18;
import 'package:flutter/material.dart' as _i16;
import 'package:revup_core/core.dart' as _i20;
import 'package:revup_provider/home/home.dart' as _i9;
import 'package:revup_provider/login/login_enter_phone/view/login_enter_phone_number_page.u.dart'
    as _i12;
import 'package:revup_provider/login/view/login_page.u.dart' as _i2;
import 'package:revup_provider/my_review/my_review.dart' as _i7;
import 'package:revup_provider/otp/view/otp_page.u.dart' as _i11;
import 'package:revup_provider/repair_service/add-product/view/add_product_page.u.dart'
    as _i14;
import 'package:revup_provider/repair_service/repair_service.dart' as _i6;
import 'package:revup_provider/repair_service/update_service/view/view.dart'
    as _i13;
import 'package:revup_provider/request/models/models.dart' as _i17;
import 'package:revup_provider/request/modules/detail_request/p16_finished_order_detail/view/p16_finished_order_detail_page.u.dart'
    as _i5;
import 'package:revup_provider/request/modules/p14_repair_completed/view/view.dart'
    as _i4;
import 'package:revup_provider/signup/view/signup_page.u.dart' as _i10;
import 'package:revup_provider/splash/splash.dart' as _i1;
import 'package:revup_provider/vendor_authentication/vender_authentication.dart'
    as _i8;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i15.AdaptivePage<void>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i15.AdaptivePage<void>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    DetailServiceRequestRoute.name: (routeData) {
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: const _i3.DetailServiceRequestPage(),
          maintainState: false);
    },
    InfoRequestRoute.name: (routeData) {
      return _i15.AdaptivePage<void>(
          routeData: routeData, child: const _i3.InfoRequestPage());
    },
    P14RepairCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<P14RepairCompleteRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i4.P14RepairCompletePage(
              key: args.key,
              finished: args.finished,
              paid: args.paid,
              vehicle: args.vehicle,
              recordId: args.recordId));
    },
    P13SelectOptionCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<P13SelectOptionCompleteRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i3.P13SelectOptionCompletePage(
              key: args.key,
              id: args.id,
              paid: args.paid,
              vehicle: args.vehicle));
    },
    P16FinishedOrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<P16FinishedOrderDetailRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child:
              _i5.P16FinishedOrderDetailPage(key: args.key, data: args.data));
    },
    AddServiceRoute.name: (routeData) {
      final args = routeData.argsAs<AddServiceRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i6.AddServicePage(args.providerID, key: args.key));
    },
    MyReviewRoute.name: (routeData) {
      final args = routeData.argsAs<MyReviewRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i7.MyReviewPage(args.providerID, key: args.key));
    },
    VendorAuthenticationRoute.name: (routeData) {
      return _i15.AdaptivePage<void>(
          routeData: routeData, child: const _i8.VendorAuthenticationPage());
    },
    ListServiceRoute.name: (routeData) {
      final args = routeData.argsAs<ListServiceRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i6.ListServicePage(args.providerID, key: args.key),
          maintainState: false);
    },
    DetailServiceRoute.name: (routeData) {
      final args = routeData.argsAs<DetailServiceRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i6.DetailServicePage(
              args.providerID, args.serviceName, args.category,
              key: args.key),
          maintainState: false);
    },
    HistoryProviderDetailRoute.name: (routeData) {
      return _i15.AdaptivePage<void>(
          routeData: routeData, child: const _i9.HistoryProviderDetailPage());
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i10.SignupPage(args.completer, args.phoneNumber,
              args.photoURL, args.uid, args.email,
              key: args.key));
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i11.OTPPage(args.phoneNumber, args.completer, key: args.key));
    },
    LoginEnterPhoneRoute.name: (routeData) {
      final args = routeData.argsAs<LoginEnterPhoneRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i12.LoginEnterPhonePage(args.completer, args.phoneNumber,
              args.photoURL, args.uid, args.email,
              key: args.key));
    },
    UpdateServiceRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateServiceRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i13.UpdateServicePage(
              args.providerID, args.category, args.sName,
              key: args.key));
    },
    P12DetailRoute.name: (routeData) {
      final args = routeData.argsAs<P12DetailRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i3.P12DetailPage(key: args.key, recordId: args.recordId));
    },
    AddProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddProductRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i14.AddProductPage(
              args.providerID, args.cate, args.sName, args.pName, args.type,
              key: args.key));
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData, child: _i9.HomePage(args.user, key: args.key));
    },
    HomePrimaryRoute.name: (routeData) {
      final args = routeData.argsAs<HomePrimaryRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i9.HomePrimaryPage(args.user, key: args.key));
    },
    HistoryProviderRoute.name: (routeData) {
      return _i15.AdaptivePage<void>(
          routeData: routeData, child: const _i9.HistoryProviderPage());
    },
    NotificationProviderRoute.name: (routeData) {
      return _i15.AdaptivePage<void>(
          routeData: routeData, child: const _i9.NotificationProviderPage());
    },
    AccountRoute.name: (routeData) {
      final args = routeData.argsAs<AccountRouteArgs>();
      return _i15.AdaptivePage<void>(
          routeData: routeData,
          child: _i9.AccountPage(args.user, key: args.key));
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(SplashRoute.name, path: '/'),
        _i15.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i15.RouteConfig(DetailServiceRequestRoute.name,
            path: '/detail-service-request-page'),
        _i15.RouteConfig(InfoRequestRoute.name, path: '/info-request-page'),
        _i15.RouteConfig(P14RepairCompleteRoute.name,
            path: '/p14-repair-complete-page'),
        _i15.RouteConfig(P13SelectOptionCompleteRoute.name,
            path: '/p13-select-option-complete-page'),
        _i15.RouteConfig(P16FinishedOrderDetailRoute.name,
            path: '/p16-finished-order-detail-page'),
        _i15.RouteConfig(AddServiceRoute.name, path: '/add-service-page'),
        _i15.RouteConfig(MyReviewRoute.name, path: '/my-review-page'),
        _i15.RouteConfig(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page'),
        _i15.RouteConfig(ListServiceRoute.name, path: '/list-service-page'),
        _i15.RouteConfig(DetailServiceRoute.name, path: '/detail-service-page'),
        _i15.RouteConfig(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page'),
        _i15.RouteConfig(SignupRoute.name, path: '/signup-page'),
        _i15.RouteConfig(OTPRoute.name, path: '/o-tp-page'),
        _i15.RouteConfig(LoginEnterPhoneRoute.name,
            path: '/login-enter-phone-page'),
        _i15.RouteConfig(UpdateServiceRoute.name, path: '/update-service-page'),
        _i15.RouteConfig(P12DetailRoute.name, path: '/p12-detail-page'),
        _i15.RouteConfig(AddProductRoute.name, path: '/add-product-page'),
        _i15.RouteConfig(HomeRoute.name, path: '/home-page', children: [
          _i15.RouteConfig(HomePrimaryRoute.name,
              path: 'home-primary-page', parent: HomeRoute.name),
          _i15.RouteConfig(HistoryProviderRoute.name,
              path: 'history-provider-page', parent: HomeRoute.name),
          _i15.RouteConfig(NotificationProviderRoute.name,
              path: 'notification-provider-page', parent: HomeRoute.name),
          _i15.RouteConfig(AccountRoute.name,
              path: 'account-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.DetailServiceRequestPage]
class DetailServiceRequestRoute extends _i15.PageRouteInfo<void> {
  const DetailServiceRequestRoute()
      : super(DetailServiceRequestRoute.name,
            path: '/detail-service-request-page');

  static const String name = 'DetailServiceRequestRoute';
}

/// generated route for
/// [_i3.InfoRequestPage]
class InfoRequestRoute extends _i15.PageRouteInfo<void> {
  const InfoRequestRoute()
      : super(InfoRequestRoute.name, path: '/info-request-page');

  static const String name = 'InfoRequestRoute';
}

/// generated route for
/// [_i4.P14RepairCompletePage]
class P14RepairCompleteRoute
    extends _i15.PageRouteInfo<P14RepairCompleteRouteArgs> {
  P14RepairCompleteRoute(
      {_i16.Key? key,
      required List<_i17.PendingServiceModel> finished,
      required List<_i17.PaidServicesModel> paid,
      required String vehicle,
      required String recordId})
      : super(P14RepairCompleteRoute.name,
            path: '/p14-repair-complete-page',
            args: P14RepairCompleteRouteArgs(
                key: key,
                finished: finished,
                paid: paid,
                vehicle: vehicle,
                recordId: recordId));

  static const String name = 'P14RepairCompleteRoute';
}

class P14RepairCompleteRouteArgs {
  const P14RepairCompleteRouteArgs(
      {this.key,
      required this.finished,
      required this.paid,
      required this.vehicle,
      required this.recordId});

  final _i16.Key? key;

  final List<_i17.PendingServiceModel> finished;

  final List<_i17.PaidServicesModel> paid;

  final String vehicle;

  final String recordId;

  @override
  String toString() {
    return 'P14RepairCompleteRouteArgs{key: $key, finished: $finished, paid: $paid, vehicle: $vehicle, recordId: $recordId}';
  }
}

/// generated route for
/// [_i3.P13SelectOptionCompletePage]
class P13SelectOptionCompleteRoute
    extends _i15.PageRouteInfo<P13SelectOptionCompleteRouteArgs> {
  P13SelectOptionCompleteRoute(
      {_i16.Key? key,
      required String id,
      required List<_i17.PaidServicesModel> paid,
      required String vehicle})
      : super(P13SelectOptionCompleteRoute.name,
            path: '/p13-select-option-complete-page',
            args: P13SelectOptionCompleteRouteArgs(
                key: key, id: id, paid: paid, vehicle: vehicle));

  static const String name = 'P13SelectOptionCompleteRoute';
}

class P13SelectOptionCompleteRouteArgs {
  const P13SelectOptionCompleteRouteArgs(
      {this.key, required this.id, required this.paid, required this.vehicle});

  final _i16.Key? key;

  final String id;

  final List<_i17.PaidServicesModel> paid;

  final String vehicle;

  @override
  String toString() {
    return 'P13SelectOptionCompleteRouteArgs{key: $key, id: $id, paid: $paid, vehicle: $vehicle}';
  }
}

/// generated route for
/// [_i5.P16FinishedOrderDetailPage]
class P16FinishedOrderDetailRoute
    extends _i15.PageRouteInfo<P16FinishedOrderDetailRouteArgs> {
  P16FinishedOrderDetailRoute(
      {_i16.Key? key,
      required _i18.Tuple2<List<_i17.PendingServiceModel>,
              List<_i17.PaidServicesModel>>
          data})
      : super(P16FinishedOrderDetailRoute.name,
            path: '/p16-finished-order-detail-page',
            args: P16FinishedOrderDetailRouteArgs(key: key, data: data));

  static const String name = 'P16FinishedOrderDetailRoute';
}

class P16FinishedOrderDetailRouteArgs {
  const P16FinishedOrderDetailRouteArgs({this.key, required this.data});

  final _i16.Key? key;

  final _i18
          .Tuple2<List<_i17.PendingServiceModel>, List<_i17.PaidServicesModel>>
      data;

  @override
  String toString() {
    return 'P16FinishedOrderDetailRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i6.AddServicePage]
class AddServiceRoute extends _i15.PageRouteInfo<AddServiceRouteArgs> {
  AddServiceRoute({required String providerID, _i16.Key? key})
      : super(AddServiceRoute.name,
            path: '/add-service-page',
            args: AddServiceRouteArgs(providerID: providerID, key: key));

  static const String name = 'AddServiceRoute';
}

class AddServiceRouteArgs {
  const AddServiceRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i16.Key? key;

  @override
  String toString() {
    return 'AddServiceRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i7.MyReviewPage]
class MyReviewRoute extends _i15.PageRouteInfo<MyReviewRouteArgs> {
  MyReviewRoute({required String providerID, _i16.Key? key})
      : super(MyReviewRoute.name,
            path: '/my-review-page',
            args: MyReviewRouteArgs(providerID: providerID, key: key));

  static const String name = 'MyReviewRoute';
}

class MyReviewRouteArgs {
  const MyReviewRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i16.Key? key;

  @override
  String toString() {
    return 'MyReviewRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i8.VendorAuthenticationPage]
class VendorAuthenticationRoute extends _i15.PageRouteInfo<void> {
  const VendorAuthenticationRoute()
      : super(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page');

  static const String name = 'VendorAuthenticationRoute';
}

/// generated route for
/// [_i6.ListServicePage]
class ListServiceRoute extends _i15.PageRouteInfo<ListServiceRouteArgs> {
  ListServiceRoute({required String providerID, _i16.Key? key})
      : super(ListServiceRoute.name,
            path: '/list-service-page',
            args: ListServiceRouteArgs(providerID: providerID, key: key));

  static const String name = 'ListServiceRoute';
}

class ListServiceRouteArgs {
  const ListServiceRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i16.Key? key;

  @override
  String toString() {
    return 'ListServiceRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i6.DetailServicePage]
class DetailServiceRoute extends _i15.PageRouteInfo<DetailServiceRouteArgs> {
  DetailServiceRoute(
      {required String providerID,
      required String serviceName,
      required String category,
      _i16.Key? key})
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

  final _i16.Key? key;

  @override
  String toString() {
    return 'DetailServiceRouteArgs{providerID: $providerID, serviceName: $serviceName, category: $category, key: $key}';
  }
}

/// generated route for
/// [_i9.HistoryProviderDetailPage]
class HistoryProviderDetailRoute extends _i15.PageRouteInfo<void> {
  const HistoryProviderDetailRoute()
      : super(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page');

  static const String name = 'HistoryProviderDetailRoute';
}

/// generated route for
/// [_i10.SignupPage]
class SignupRoute extends _i15.PageRouteInfo<SignupRouteArgs> {
  SignupRoute(
      {required _i19.Completer<_i20.AppUser> completer,
      required String phoneNumber,
      required String photoURL,
      required String uid,
      required String email,
      _i16.Key? key})
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

  final _i19.Completer<_i20.AppUser> completer;

  final String phoneNumber;

  final String photoURL;

  final String uid;

  final String email;

  final _i16.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{completer: $completer, phoneNumber: $phoneNumber, photoURL: $photoURL, uid: $uid, email: $email, key: $key}';
  }
}

/// generated route for
/// [_i11.OTPPage]
class OTPRoute extends _i15.PageRouteInfo<OTPRouteArgs> {
  OTPRoute(
      {required String phoneNumber,
      required _i19.Completer<String> completer,
      _i16.Key? key})
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

  final _i19.Completer<String> completer;

  final _i16.Key? key;

  @override
  String toString() {
    return 'OTPRouteArgs{phoneNumber: $phoneNumber, completer: $completer, key: $key}';
  }
}

/// generated route for
/// [_i12.LoginEnterPhonePage]
class LoginEnterPhoneRoute
    extends _i15.PageRouteInfo<LoginEnterPhoneRouteArgs> {
  LoginEnterPhoneRoute(
      {required _i19.Completer<_i20.AppUser> completer,
      required String phoneNumber,
      required String photoURL,
      required String uid,
      required String email,
      _i16.Key? key})
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

  final _i19.Completer<_i20.AppUser> completer;

  final String phoneNumber;

  final String photoURL;

  final String uid;

  final String email;

  final _i16.Key? key;

  @override
  String toString() {
    return 'UpdateServiceRouteArgs{providerID: $providerID, category: $category, sName: $sName, key: $key}';
  }
}

/// generated route for
/// [_i13.UpdateServicePage]
class UpdateServiceRoute extends _i15.PageRouteInfo<UpdateServiceRouteArgs> {
  UpdateServiceRoute(
      {required String providerID,
      required String category,
      required String sName,
      _i16.Key? key})
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

  final _i16.Key? key;

  @override
  String toString() {
    return 'UpdateServiceRouteArgs{providerID: $providerID, category: $category, sName: $sName, key: $key}';
  }
}

/// generated route for
/// [_i3.P12DetailPage]
class P12DetailRoute extends _i15.PageRouteInfo<P12DetailRouteArgs> {
  P12DetailRoute({_i16.Key? key, required String recordId})
      : super(P12DetailRoute.name,
            path: '/p12-detail-page',
            args: P12DetailRouteArgs(key: key, recordId: recordId));

  static const String name = 'P12DetailRoute';
}

class P12DetailRouteArgs {
  const P12DetailRouteArgs({this.key, required this.recordId});

  final _i16.Key? key;

  final String recordId;

  @override
  String toString() {
    return 'P12DetailRouteArgs{key: $key, recordId: $recordId}';
  }
}

/// generated route for
/// [_i14.AddProductPage]
class AddProductRoute extends _i15.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute(
      {required String providerID,
      required String cate,
      required String sName,
      required String pName,
      required int type,
      _i16.Key? key})
      : super(AddProductRoute.name,
            path: '/add-product-page',
            args: AddProductRouteArgs(
                providerID: providerID,
                cate: cate,
                sName: sName,
                pName: pName,
                type: type,
                key: key));

  static const String name = 'AddProductRoute';
}

class AddProductRouteArgs {
  const AddProductRouteArgs(
      {required this.providerID,
      required this.cate,
      required this.sName,
      required this.pName,
      required this.type,
      this.key});

  final String providerID;

  final String cate;

  final String sName;

  final String pName;

  final int type;

  final _i16.Key? key;

  @override
  String toString() {
    return 'AddProductRouteArgs{providerID: $providerID, cate: $cate, sName: $sName, pName: $pName, type: $type, key: $key}';
  }
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i15.PageRouteInfo<HomeRouteArgs> {
  HomeRoute(
      {required _i20.AppUser user,
      _i16.Key? key,
      List<_i15.PageRouteInfo>? children})
      : super(HomeRoute.name,
            path: '/home-page',
            args: HomeRouteArgs(user: user, key: key),
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({required this.user, this.key});

  final _i20.AppUser user;

  final _i16.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i9.HomePrimaryPage]
class HomePrimaryRoute extends _i15.PageRouteInfo<HomePrimaryRouteArgs> {
  HomePrimaryRoute({required _i20.AppUser user, _i16.Key? key})
      : super(HomePrimaryRoute.name,
            path: 'home-primary-page',
            args: HomePrimaryRouteArgs(user: user, key: key));

  static const String name = 'HomePrimaryRoute';
}

class HomePrimaryRouteArgs {
  const HomePrimaryRouteArgs({required this.user, this.key});

  final _i20.AppUser user;

  final _i16.Key? key;

  @override
  String toString() {
    return 'HomePrimaryRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i9.HistoryProviderPage]
class HistoryProviderRoute extends _i15.PageRouteInfo<void> {
  const HistoryProviderRoute()
      : super(HistoryProviderRoute.name, path: 'history-provider-page');

  static const String name = 'HistoryProviderRoute';
}

/// generated route for
/// [_i9.NotificationProviderPage]
class NotificationProviderRoute extends _i15.PageRouteInfo<void> {
  const NotificationProviderRoute()
      : super(NotificationProviderRoute.name,
            path: 'notification-provider-page');

  static const String name = 'NotificationProviderRoute';
}

/// generated route for
/// [_i9.AccountPage]
class AccountRoute extends _i15.PageRouteInfo<AccountRouteArgs> {
  AccountRoute({required _i20.AppUser user, _i16.Key? key})
      : super(AccountRoute.name,
            path: 'account-page', args: AccountRouteArgs(user: user, key: key));

  static const String name = 'AccountRoute';
}

class AccountRouteArgs {
  const AccountRouteArgs({required this.user, this.key});

  final _i20.AppUser user;

  final _i16.Key? key;

  @override
  String toString() {
    return 'AccountRouteArgs{user: $user, key: $key}';
  }
}
