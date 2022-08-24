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
import 'dart:async' as _i27;

import 'package:auto_route/auto_route.dart' as _i21;
import 'package:dartz/dartz.dart' as _i24;
import 'package:flutter/material.dart' as _i22;
import 'package:revup_core/core.dart' as _i26;
import 'package:revup_provider/change_language/view/change_language_page.dart'
    as _i20;
import 'package:revup_provider/home/home.dart' as _i11;
import 'package:revup_provider/login/login_enter_phone/view/login_enter_phone_number_page.u.dart'
    as _i14;
import 'package:revup_provider/login/view/login_page.u.dart' as _i2;
import 'package:revup_provider/my_review/my_review.dart' as _i9;
import 'package:revup_provider/new_request/models/pending_repair_request.dart'
    as _i23;
import 'package:revup_provider/new_request/view/new_request_page.dart' as _i15;
import 'package:revup_provider/otp/view/otp_page.u.dart' as _i13;
import 'package:revup_provider/permission_page/view/permission_page.u.dart'
    as _i19;
import 'package:revup_provider/repair_request/models/need_to_verify_model.dart'
    as _i25;
import 'package:revup_provider/repair_request/modules/detail_request/p10_quote_price/view/p10_quote_price_page.dart'
    as _i16;
import 'package:revup_provider/repair_request/modules/detail_request/p16_finished_order_detail/view/p16_finished_order_detail_page.u.dart'
    as _i7;
import 'package:revup_provider/repair_request/modules/detail_request/p3_request_detail/view/p3_request_detail.u.dart'
    as _i3;
import 'package:revup_provider/repair_request/modules/p14_repair_completed/view/p14_repair_completed_page.u.dart'
    as _i5;
import 'package:revup_provider/repair_request/modules/p4_info_request/view/info_request_page.u.dart'
    as _i4;
import 'package:revup_provider/repair_request/request.dart' as _i6;
import 'package:revup_provider/repair_service/add-product/view/add_product_page.u.dart'
    as _i18;
import 'package:revup_provider/repair_service/repair_service.dart' as _i8;
import 'package:revup_provider/repair_service/update_service/view/view.dart'
    as _i17;
import 'package:revup_provider/signup/view/signup_page.u.dart' as _i12;
import 'package:revup_provider/splash/splash.dart' as _i1;
import 'package:revup_provider/vendor_authentication/vender_authentication.dart'
    as _i10;

class AppRouter extends _i21.RootStackRouter {
  AppRouter([_i22.GlobalKey<_i22.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i21.AdaptivePage<void>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginRoute.name: (routeData) {
      return _i21.AdaptivePage<void>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    P3RequestDetailRoute.name: (routeData) {
      final args = routeData.argsAs<P3RequestDetailRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i3.P3RequestDetailPage(
              key: args.key,
              record: args.record,
              pendingService: args.pendingService,
              needToVerify: args.needToVerify,
              pendingAmount: args.pendingAmount),
          maintainState: false);
    },
    InfoRequestRoute.name: (routeData) {
      final args = routeData.argsAs<InfoRequestRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i4.InfoRequestPage(
              key: args.key,
              consumer: args.consumer,
              record: args.record,
              distance: args.distance,
              pendingService: args.pendingService,
              pendingAmount: args.pendingAmount));
    },
    P14RepairCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<P14RepairCompleteRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i5.P14RepairCompletePage(
              key: args.key,
              finished: args.finished,
              paid: args.paid,
              vehicle: args.vehicle,
              recordId: args.recordId));
    },
    P13SelectOptionCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<P13SelectOptionCompleteRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i6.P13SelectOptionCompletePage(
              key: args.key,
              id: args.id,
              paid: args.paid,
              vehicle: args.vehicle));
    },
    P16FinishedOrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<P16FinishedOrderDetailRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child:
              _i7.P16FinishedOrderDetailPage(key: args.key, data: args.data));
    },
    AddServiceRoute.name: (routeData) {
      final args = routeData.argsAs<AddServiceRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i8.AddServicePage(args.providerID, key: args.key));
    },
    MyReviewRoute.name: (routeData) {
      final args = routeData.argsAs<MyReviewRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i9.MyReviewPage(args.providerID, key: args.key));
    },
    VendorAuthenticationRoute.name: (routeData) {
      final args = routeData.argsAs<VendorAuthenticationRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i10.VendorAuthenticationPage(args.user, key: args.key));
    },
    ListServiceRoute.name: (routeData) {
      final args = routeData.argsAs<ListServiceRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i8.ListServicePage(args.providerID, key: args.key),
          maintainState: false);
    },
    DetailServiceRoute.name: (routeData) {
      final args = routeData.argsAs<DetailServiceRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i8.DetailServicePage(
              args.providerID, args.serviceName, args.category,
              key: args.key),
          maintainState: false);
    },
    HistoryProviderDetailRoute.name: (routeData) {
      return _i21.AdaptivePage<void>(
          routeData: routeData, child: const _i11.HistoryProviderDetailPage());
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i12.SignupPage(args.completer, args.phoneNumber,
              args.photoURL, args.uid, args.email,
              key: args.key));
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i13.OTPPage(args.phoneNumber, args.completer, key: args.key));
    },
    LoginEnterPhoneRoute.name: (routeData) {
      final args = routeData.argsAs<LoginEnterPhoneRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i14.LoginEnterPhonePage(args.completer, args.phoneNumber,
              args.photoURL, args.uid, args.email,
              key: args.key));
    },
    NewRequestRoute.name: (routeData) {
      return _i21.AdaptivePage<void>(
          routeData: routeData, child: const _i15.NewRequestPage());
    },
    P12DetailRoute.name: (routeData) {
      final args = routeData.argsAs<P12DetailRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i6.P12DetailPage(key: args.key, recordId: args.recordId));
    },
    P10QuotePriceRoute.name: (routeData) {
      final args = routeData.argsAs<P10QuotePriceRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i16.P10QuotePricePage(
              key: args.key,
              record: args.record,
              pendingService: args.pendingService,
              pendingAmount: args.pendingAmount));
    },
    UpdateServiceRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateServiceRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i17.UpdateServicePage(
              args.providerID, args.category, args.sName,
              key: args.key));
    },
    AddProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddProductRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i18.AddProductPage(
              args.providerID, args.cate, args.sName, args.pName, args.type,
              key: args.key));
    },
    PermissionRoute.name: (routeData) {
      return _i21.AdaptivePage<void>(
          routeData: routeData, child: const _i19.PermissionPage());
    },
    ChangeLanguageRoute.name: (routeData) {
      return _i21.AdaptivePage<void>(
          routeData: routeData, child: const _i20.ChangeLanguagePage());
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData, child: _i11.HomePage(args.user, key: args.key));
    },
    HomePrimaryRoute.name: (routeData) {
      final args = routeData.argsAs<HomePrimaryRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i11.HomePrimaryPage(args.user, key: args.key));
    },
    HistoryProviderRoute.name: (routeData) {
      return _i21.AdaptivePage<void>(
          routeData: routeData, child: const _i11.HistoryProviderPage());
    },
    NotificationProviderRoute.name: (routeData) {
      return _i21.AdaptivePage<void>(
          routeData: routeData, child: const _i11.NotificationProviderPage());
    },
    AccountRoute.name: (routeData) {
      final args = routeData.argsAs<AccountRouteArgs>();
      return _i21.AdaptivePage<void>(
          routeData: routeData,
          child: _i11.AccountPage(args.user, key: args.key));
    }
  };

  @override
  List<_i21.RouteConfig> get routes => [
        _i21.RouteConfig(SplashRoute.name, path: '/'),
        _i21.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i21.RouteConfig(P3RequestDetailRoute.name,
            path: '/p3-request-detail-page'),
        _i21.RouteConfig(InfoRequestRoute.name, path: '/info-request-page'),
        _i21.RouteConfig(P14RepairCompleteRoute.name,
            path: '/p14-repair-complete-page'),
        _i21.RouteConfig(P13SelectOptionCompleteRoute.name,
            path: '/p13-select-option-complete-page'),
        _i21.RouteConfig(P16FinishedOrderDetailRoute.name,
            path: '/p16-finished-order-detail-page'),
        _i21.RouteConfig(AddServiceRoute.name, path: '/add-service-page'),
        _i21.RouteConfig(MyReviewRoute.name, path: '/my-review-page'),
        _i21.RouteConfig(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page'),
        _i21.RouteConfig(ListServiceRoute.name, path: '/list-service-page'),
        _i21.RouteConfig(DetailServiceRoute.name, path: '/detail-service-page'),
        _i21.RouteConfig(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page'),
        _i21.RouteConfig(SignupRoute.name, path: '/signup-page'),
        _i21.RouteConfig(OTPRoute.name, path: '/o-tp-page'),
        _i21.RouteConfig(LoginEnterPhoneRoute.name,
            path: '/login-enter-phone-page'),
        _i21.RouteConfig(NewRequestRoute.name, path: '/new-request-page'),
        _i21.RouteConfig(P12DetailRoute.name, path: '/p12-detail-page'),
        _i21.RouteConfig(P10QuotePriceRoute.name,
            path: '/p10-quote-price-page'),
        _i21.RouteConfig(UpdateServiceRoute.name, path: '/update-service-page'),
        _i21.RouteConfig(AddProductRoute.name, path: '/add-product-page'),
        _i21.RouteConfig(PermissionRoute.name, path: '/permission-page'),
        _i21.RouteConfig(ChangeLanguageRoute.name,
            path: '/change-language-page'),
        _i21.RouteConfig(HomeRoute.name, path: '/home-page', children: [
          _i21.RouteConfig(HomePrimaryRoute.name,
              path: 'home-primary-page', parent: HomeRoute.name),
          _i21.RouteConfig(HistoryProviderRoute.name,
              path: 'history-provider-page', parent: HomeRoute.name),
          _i21.RouteConfig(NotificationProviderRoute.name,
              path: 'notification-provider-page', parent: HomeRoute.name),
          _i21.RouteConfig(AccountRoute.name,
              path: 'account-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i21.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i21.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.P3RequestDetailPage]
class P3RequestDetailRoute
    extends _i21.PageRouteInfo<P3RequestDetailRouteArgs> {
  P3RequestDetailRoute(
      {_i22.Key? key,
      required _i23.PendingRepairRequest record,
      required _i24.IList<_i6.PendingServiceModel> pendingService,
      required List<_i25.NeedToVerifyModel> needToVerify,
      required int pendingAmount})
      : super(P3RequestDetailRoute.name,
            path: '/p3-request-detail-page',
            args: P3RequestDetailRouteArgs(
                key: key,
                record: record,
                pendingService: pendingService,
                needToVerify: needToVerify,
                pendingAmount: pendingAmount));

  static const String name = 'P3RequestDetailRoute';
}

class P3RequestDetailRouteArgs {
  const P3RequestDetailRouteArgs(
      {this.key,
      required this.record,
      required this.pendingService,
      required this.needToVerify,
      required this.pendingAmount});

  final _i22.Key? key;

  final _i23.PendingRepairRequest record;

  final _i24.IList<_i6.PendingServiceModel> pendingService;

  final List<_i25.NeedToVerifyModel> needToVerify;

  final int pendingAmount;

  @override
  String toString() {
    return 'P3RequestDetailRouteArgs{key: $key, record: $record, pendingService: $pendingService, needToVerify: $needToVerify, pendingAmount: $pendingAmount}';
  }
}

/// generated route for
/// [_i4.InfoRequestPage]
class InfoRequestRoute extends _i21.PageRouteInfo<InfoRequestRouteArgs> {
  InfoRequestRoute(
      {_i22.Key? key,
      required _i26.AppUser consumer,
      required _i23.PendingRepairRequest record,
      required double distance,
      required _i24.IList<_i6.PendingServiceModel> pendingService,
      required int pendingAmount})
      : super(InfoRequestRoute.name,
            path: '/info-request-page',
            args: InfoRequestRouteArgs(
                key: key,
                consumer: consumer,
                record: record,
                distance: distance,
                pendingService: pendingService,
                pendingAmount: pendingAmount));

  static const String name = 'InfoRequestRoute';
}

class InfoRequestRouteArgs {
  const InfoRequestRouteArgs(
      {this.key,
      required this.consumer,
      required this.record,
      required this.distance,
      required this.pendingService,
      required this.pendingAmount});

  final _i22.Key? key;

  final _i26.AppUser consumer;

  final _i23.PendingRepairRequest record;

  final double distance;

  final _i24.IList<_i6.PendingServiceModel> pendingService;

  final int pendingAmount;

  @override
  String toString() {
    return 'InfoRequestRouteArgs{key: $key, consumer: $consumer, record: $record, distance: $distance, pendingService: $pendingService, pendingAmount: $pendingAmount}';
  }
}

/// generated route for
/// [_i5.P14RepairCompletePage]
class P14RepairCompleteRoute
    extends _i21.PageRouteInfo<P14RepairCompleteRouteArgs> {
  P14RepairCompleteRoute(
      {_i22.Key? key,
      required List<_i6.PendingServiceModel> finished,
      required List<_i6.PaidServicesModel> paid,
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

  final _i22.Key? key;

  final List<_i6.PendingServiceModel> finished;

  final List<_i6.PaidServicesModel> paid;

  final String vehicle;

  final String recordId;

  @override
  String toString() {
    return 'P14RepairCompleteRouteArgs{key: $key, finished: $finished, paid: $paid, vehicle: $vehicle, recordId: $recordId}';
  }
}

/// generated route for
/// [_i6.P13SelectOptionCompletePage]
class P13SelectOptionCompleteRoute
    extends _i21.PageRouteInfo<P13SelectOptionCompleteRouteArgs> {
  P13SelectOptionCompleteRoute(
      {_i22.Key? key,
      required String id,
      required List<_i6.PaidServicesModel> paid,
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

  final _i22.Key? key;

  final String id;

  final List<_i6.PaidServicesModel> paid;

  final String vehicle;

  @override
  String toString() {
    return 'P13SelectOptionCompleteRouteArgs{key: $key, id: $id, paid: $paid, vehicle: $vehicle}';
  }
}

/// generated route for
/// [_i7.P16FinishedOrderDetailPage]
class P16FinishedOrderDetailRoute
    extends _i21.PageRouteInfo<P16FinishedOrderDetailRouteArgs> {
  P16FinishedOrderDetailRoute(
      {_i22.Key? key,
      required _i24.Tuple2<List<_i6.PendingServiceModel>,
              List<_i6.PaidServicesModel>>
          data})
      : super(P16FinishedOrderDetailRoute.name,
            path: '/p16-finished-order-detail-page',
            args: P16FinishedOrderDetailRouteArgs(key: key, data: data));

  static const String name = 'P16FinishedOrderDetailRoute';
}

class P16FinishedOrderDetailRouteArgs {
  const P16FinishedOrderDetailRouteArgs({this.key, required this.data});

  final _i22.Key? key;

  final _i24.Tuple2<List<_i6.PendingServiceModel>, List<_i6.PaidServicesModel>>
      data;

  @override
  String toString() {
    return 'P16FinishedOrderDetailRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i8.AddServicePage]
class AddServiceRoute extends _i21.PageRouteInfo<AddServiceRouteArgs> {
  AddServiceRoute({required String providerID, _i22.Key? key})
      : super(AddServiceRoute.name,
            path: '/add-service-page',
            args: AddServiceRouteArgs(providerID: providerID, key: key));

  static const String name = 'AddServiceRoute';
}

class AddServiceRouteArgs {
  const AddServiceRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i22.Key? key;

  @override
  String toString() {
    return 'AddServiceRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i9.MyReviewPage]
class MyReviewRoute extends _i21.PageRouteInfo<MyReviewRouteArgs> {
  MyReviewRoute({required String providerID, _i22.Key? key})
      : super(MyReviewRoute.name,
            path: '/my-review-page',
            args: MyReviewRouteArgs(providerID: providerID, key: key));

  static const String name = 'MyReviewRoute';
}

class MyReviewRouteArgs {
  const MyReviewRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i22.Key? key;

  @override
  String toString() {
    return 'MyReviewRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i10.VendorAuthenticationPage]
class VendorAuthenticationRoute
    extends _i21.PageRouteInfo<VendorAuthenticationRouteArgs> {
  VendorAuthenticationRoute({required _i26.AppUser user, _i22.Key? key})
      : super(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page',
            args: VendorAuthenticationRouteArgs(user: user, key: key));

  static const String name = 'VendorAuthenticationRoute';
}

class VendorAuthenticationRouteArgs {
  const VendorAuthenticationRouteArgs({required this.user, this.key});

  final _i26.AppUser user;

  final _i22.Key? key;

  @override
  String toString() {
    return 'VendorAuthenticationRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i8.ListServicePage]
class ListServiceRoute extends _i21.PageRouteInfo<ListServiceRouteArgs> {
  ListServiceRoute({required String providerID, _i22.Key? key})
      : super(ListServiceRoute.name,
            path: '/list-service-page',
            args: ListServiceRouteArgs(providerID: providerID, key: key));

  static const String name = 'ListServiceRoute';
}

class ListServiceRouteArgs {
  const ListServiceRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i22.Key? key;

  @override
  String toString() {
    return 'ListServiceRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i8.DetailServicePage]
class DetailServiceRoute extends _i21.PageRouteInfo<DetailServiceRouteArgs> {
  DetailServiceRoute(
      {required String providerID,
      required String serviceName,
      required String category,
      _i22.Key? key})
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

  final _i22.Key? key;

  @override
  String toString() {
    return 'DetailServiceRouteArgs{providerID: $providerID, serviceName: $serviceName, category: $category, key: $key}';
  }
}

/// generated route for
/// [_i11.HistoryProviderDetailPage]
class HistoryProviderDetailRoute extends _i21.PageRouteInfo<void> {
  const HistoryProviderDetailRoute()
      : super(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page');

  static const String name = 'HistoryProviderDetailRoute';
}

/// generated route for
/// [_i12.SignupPage]
class SignupRoute extends _i21.PageRouteInfo<SignupRouteArgs> {
  SignupRoute(
      {required _i27.Completer<_i26.AppUser> completer,
      required String phoneNumber,
      required String photoURL,
      required String uid,
      required String email,
      _i22.Key? key})
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

  final _i27.Completer<_i26.AppUser> completer;

  final String phoneNumber;

  final String photoURL;

  final String uid;

  final String email;

  final _i22.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{completer: $completer, phoneNumber: $phoneNumber, photoURL: $photoURL, uid: $uid, email: $email, key: $key}';
  }
}

/// generated route for
/// [_i13.OTPPage]
class OTPRoute extends _i21.PageRouteInfo<OTPRouteArgs> {
  OTPRoute(
      {required String phoneNumber,
      required _i27.Completer<String> completer,
      _i22.Key? key})
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

  final _i27.Completer<String> completer;

  final _i22.Key? key;

  @override
  String toString() {
    return 'OTPRouteArgs{phoneNumber: $phoneNumber, completer: $completer, key: $key}';
  }
}

/// generated route for
/// [_i14.LoginEnterPhonePage]
class LoginEnterPhoneRoute
    extends _i21.PageRouteInfo<LoginEnterPhoneRouteArgs> {
  LoginEnterPhoneRoute(
      {required _i27.Completer<_i26.AppUser> completer,
      required String phoneNumber,
      required String photoURL,
      required String uid,
      required String email,
      _i22.Key? key})
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

  final _i27.Completer<_i26.AppUser> completer;

  final String phoneNumber;

  final String photoURL;

  final String uid;

  final String email;

  final _i22.Key? key;

  @override
  String toString() {
    return 'LoginEnterPhoneRouteArgs{completer: $completer, phoneNumber: $phoneNumber, photoURL: $photoURL, uid: $uid, email: $email, key: $key}';
  }
}

/// generated route for
/// [_i15.NewRequestPage]
class NewRequestRoute extends _i21.PageRouteInfo<void> {
  const NewRequestRoute()
      : super(NewRequestRoute.name, path: '/new-request-page');

  static const String name = 'NewRequestRoute';
}

/// generated route for
/// [_i6.P12DetailPage]
class P12DetailRoute extends _i21.PageRouteInfo<P12DetailRouteArgs> {
  P12DetailRoute({_i22.Key? key, required String recordId})
      : super(P12DetailRoute.name,
            path: '/p12-detail-page',
            args: P12DetailRouteArgs(key: key, recordId: recordId));

  static const String name = 'P12DetailRoute';
}

class P12DetailRouteArgs {
  const P12DetailRouteArgs({this.key, required this.recordId});

  final _i22.Key? key;

  final String recordId;

  @override
  String toString() {
    return 'P12DetailRouteArgs{key: $key, recordId: $recordId}';
  }
}

/// generated route for
/// [_i16.P10QuotePricePage]
class P10QuotePriceRoute extends _i21.PageRouteInfo<P10QuotePriceRouteArgs> {
  P10QuotePriceRoute(
      {_i22.Key? key,
      required _i23.PendingRepairRequest record,
      required _i24.IList<_i6.PendingServiceModel> pendingService,
      required int pendingAmount})
      : super(P10QuotePriceRoute.name,
            path: '/p10-quote-price-page',
            args: P10QuotePriceRouteArgs(
                key: key,
                record: record,
                pendingService: pendingService,
                pendingAmount: pendingAmount));

  static const String name = 'P10QuotePriceRoute';
}

class P10QuotePriceRouteArgs {
  const P10QuotePriceRouteArgs(
      {this.key,
      required this.record,
      required this.pendingService,
      required this.pendingAmount});

  final _i22.Key? key;

  final _i23.PendingRepairRequest record;

  final _i24.IList<_i6.PendingServiceModel> pendingService;

  final int pendingAmount;

  @override
  String toString() {
    return 'P10QuotePriceRouteArgs{key: $key, record: $record, pendingService: $pendingService, pendingAmount: $pendingAmount}';
  }
}

/// generated route for
/// [_i17.UpdateServicePage]
class UpdateServiceRoute extends _i21.PageRouteInfo<UpdateServiceRouteArgs> {
  UpdateServiceRoute(
      {required String providerID,
      required String category,
      required String sName,
      _i22.Key? key})
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

  final _i22.Key? key;

  @override
  String toString() {
    return 'UpdateServiceRouteArgs{providerID: $providerID, category: $category, sName: $sName, key: $key}';
  }
}

/// generated route for
/// [_i18.AddProductPage]
class AddProductRoute extends _i21.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute(
      {required String providerID,
      required String cate,
      required String sName,
      required String pName,
      required int type,
      _i22.Key? key})
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

  final _i22.Key? key;

  @override
  String toString() {
    return 'AddProductRouteArgs{providerID: $providerID, cate: $cate, sName: $sName, pName: $pName, type: $type, key: $key}';
  }
}

/// generated route for
/// [_i19.PermissionPage]
class PermissionRoute extends _i21.PageRouteInfo<void> {
  const PermissionRoute()
      : super(PermissionRoute.name, path: '/permission-page');

  static const String name = 'PermissionRoute';
}

/// generated route for
/// [_i20.ChangeLanguagePage]
class ChangeLanguageRoute extends _i21.PageRouteInfo<void> {
  const ChangeLanguageRoute()
      : super(ChangeLanguageRoute.name, path: '/change-language-page');

  static const String name = 'ChangeLanguageRoute';
}

/// generated route for
/// [_i11.HomePage]
class HomeRoute extends _i21.PageRouteInfo<HomeRouteArgs> {
  HomeRoute(
      {required _i26.AppUser user,
      _i22.Key? key,
      List<_i21.PageRouteInfo>? children})
      : super(HomeRoute.name,
            path: '/home-page',
            args: HomeRouteArgs(user: user, key: key),
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({required this.user, this.key});

  final _i26.AppUser user;

  final _i22.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i11.HomePrimaryPage]
class HomePrimaryRoute extends _i21.PageRouteInfo<HomePrimaryRouteArgs> {
  HomePrimaryRoute({required _i26.AppUser user, _i22.Key? key})
      : super(HomePrimaryRoute.name,
            path: 'home-primary-page',
            args: HomePrimaryRouteArgs(user: user, key: key));

  static const String name = 'HomePrimaryRoute';
}

class HomePrimaryRouteArgs {
  const HomePrimaryRouteArgs({required this.user, this.key});

  final _i26.AppUser user;

  final _i22.Key? key;

  @override
  String toString() {
    return 'HomePrimaryRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i11.HistoryProviderPage]
class HistoryProviderRoute extends _i21.PageRouteInfo<void> {
  const HistoryProviderRoute()
      : super(HistoryProviderRoute.name, path: 'history-provider-page');

  static const String name = 'HistoryProviderRoute';
}

/// generated route for
/// [_i11.NotificationProviderPage]
class NotificationProviderRoute extends _i21.PageRouteInfo<void> {
  const NotificationProviderRoute()
      : super(NotificationProviderRoute.name,
            path: 'notification-provider-page');

  static const String name = 'NotificationProviderRoute';
}

/// generated route for
/// [_i11.AccountPage]
class AccountRoute extends _i21.PageRouteInfo<AccountRouteArgs> {
  AccountRoute({required _i26.AppUser user, _i22.Key? key})
      : super(AccountRoute.name,
            path: 'account-page', args: AccountRouteArgs(user: user, key: key));

  static const String name = 'AccountRoute';
}

class AccountRouteArgs {
  const AccountRouteArgs({required this.user, this.key});

  final _i26.AppUser user;

  final _i22.Key? key;

  @override
  String toString() {
    return 'AccountRouteArgs{user: $user, key: $key}';
  }
}
