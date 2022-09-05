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
import 'dart:async' as _i33;
import 'dart:io' as _i34;

import 'package:auto_route/auto_route.dart' as _i28;
import 'package:dartz/dartz.dart' as _i31;
import 'package:flutter/material.dart' as _i29;
import 'package:revup_core/core.dart' as _i32;
import 'package:revup_provider/analytics/view/analytics_page.dart' as _i2;
import 'package:revup_provider/change_language/view/change_language_page.dart'
    as _i24;
import 'package:revup_provider/common_product/view/common_product_page.dart'
    as _i26;
import 'package:revup_provider/common_service/view/common_service_page.dart'
    as _i25;
import 'package:revup_provider/home/home.dart' as _i27;
import 'package:revup_provider/home/modules/history/history_provider_detail/view/history_detail_page.u.dart'
    as _i12;
import 'package:revup_provider/login/login_enter_phone/view/login_enter_phone_number_page.u.dart'
    as _i16;
import 'package:revup_provider/login/view/login_page.u.dart' as _i3;
import 'package:revup_provider/map_route/view/map_route_page.dart' as _i23;
import 'package:revup_provider/my_review/my_review.dart' as _i10;
import 'package:revup_provider/new_request/models/pending_repair_request.dart'
    as _i30;
import 'package:revup_provider/new_request/view/new_request_page.dart' as _i17;
import 'package:revup_provider/otp/view/otp_page.u.dart' as _i14;
import 'package:revup_provider/permission_page/permission_page.u.dart' as _i22;
import 'package:revup_provider/repair_request/modules/p10_quote_price/view/p10_quote_price_page.dart'
    as _i19;
import 'package:revup_provider/repair_request/modules/p12_detail_order/view/p12_detail_page.u.dart'
    as _i18;
import 'package:revup_provider/repair_request/modules/p14_repair_completed/view/p14_repair_completed_page.u.dart'
    as _i6;
import 'package:revup_provider/repair_request/modules/p16_finished_order_detail/view/p16_finished_order_detail_page.u.dart'
    as _i8;
import 'package:revup_provider/repair_request/modules/p3_request_detail/view/p3_request_detail.u.dart'
    as _i4;
import 'package:revup_provider/repair_request/modules/p4_info_request/view/info_request_page.u.dart'
    as _i5;
import 'package:revup_provider/repair_request/request.dart' as _i7;
import 'package:revup_provider/repair_service/add-product/view/add_product_page.u.dart'
    as _i21;
import 'package:revup_provider/repair_service/repair_service.dart' as _i9;
import 'package:revup_provider/repair_service/update_service/view/view.dart'
    as _i20;
import 'package:revup_provider/signup/view/signup_page.u.dart' as _i13;
import 'package:revup_provider/splash/splash.dart' as _i1;
import 'package:revup_provider/test/test.dart' as _i15;
import 'package:revup_provider/vendor_authentication/vender_authentication.dart'
    as _i11;

class AppRouter extends _i28.RootStackRouter {
  AppRouter([_i29.GlobalKey<_i29.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i28.AdaptivePage<void>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    AnalyticsRoute.name: (routeData) {
      final args = routeData.argsAs<AnalyticsRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i2.AnalyticsPage(args.providerID, key: args.key));
    },
    LoginRoute.name: (routeData) {
      return _i28.AdaptivePage<void>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    P3RequestDetailRoute.name: (routeData) {
      final args = routeData.argsAs<P3RequestDetailRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i4.P3RequestDetailPage(
              key: args.key,
              record: args.record,
              pendingService: args.pendingService,
              needToVerify: args.needToVerify,
              pendingAmount: args.pendingAmount));
    },
    InfoRequestRoute.name: (routeData) {
      final args = routeData.argsAs<InfoRequestRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i5.InfoRequestPage(
              key: args.key,
              consumer: args.consumer,
              recordId: args.recordId,
              distance: args.distance,
              pendingService: args.pendingService,
              pendingAmount: args.pendingAmount));
    },
    P14RepairCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<P14RepairCompleteRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i6.P14RepairCompletePage(
              key: args.key,
              finished: args.finished,
              paid: args.paid,
              vehicle: args.vehicle,
              recordId: args.recordId));
    },
    P13SelectOptionCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<P13SelectOptionCompleteRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i7.P13SelectOptionCompletePage(
              key: args.key,
              id: args.id,
              paid: args.paid,
              vehicle: args.vehicle));
    },
    P16FinishedOrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<P16FinishedOrderDetailRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child:
              _i8.P16FinishedOrderDetailPage(key: args.key, data: args.data));
    },
    AddServiceRoute.name: (routeData) {
      final args = routeData.argsAs<AddServiceRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i9.AddServicePage(args.providerID, key: args.key));
    },
    MyReviewRoute.name: (routeData) {
      final args = routeData.argsAs<MyReviewRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i10.MyReviewPage(args.providerID, key: args.key));
    },
    VendorAuthenticationRoute.name: (routeData) {
      final args = routeData.argsAs<VendorAuthenticationRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i11.VendorAuthenticationPage(args.user, key: args.key));
    },
    ListServiceRoute.name: (routeData) {
      final args = routeData.argsAs<ListServiceRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i9.ListServicePage(args.providerID, key: args.key));
    },
    DetailServiceRoute.name: (routeData) {
      final args = routeData.argsAs<DetailServiceRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i9.DetailServicePage(
              args.providerID, args.serviceName, args.category,
              key: args.key));
    },
    HistoryProviderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryProviderDetailRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i12.HistoryProviderDetailPage(args.rpID, key: args.key));
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i13.SignupPage(args.completer, args.phoneNumber,
              args.photoURL, args.uid, args.email,
              key: args.key));
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i14.OTPPage(args.phoneNumber, args.completer, key: args.key));
    },
    TestRoute.name: (routeData) {
      final args = routeData.argsAs<TestRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i15.TestPage(args.providerID, args.sortType, key: args.key));
    },
    LoginEnterPhoneRoute.name: (routeData) {
      final args = routeData.argsAs<LoginEnterPhoneRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i16.LoginEnterPhonePage(args.completer, args.phoneNumber,
              args.photoURL, args.uid, args.email,
              key: args.key));
    },
    NewRequestRoute.name: (routeData) {
      final args = routeData.argsAs<NewRequestRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i17.NewRequestPage(key: args.key, recordId: args.recordId));
    },
    P12DetailRoute.name: (routeData) {
      final args = routeData.argsAs<P12DetailRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i18.P12DetailPage(key: args.key, recordId: args.recordId));
    },
    P10QuotePriceRoute.name: (routeData) {
      final args = routeData.argsAs<P10QuotePriceRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i19.P10QuotePricePage(
              key: args.key,
              record: args.record,
              pendingService: args.pendingService,
              pendingAmount: args.pendingAmount));
    },
    UpdateServiceRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateServiceRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i20.UpdateServicePage(
              args.providerID, args.category, args.sName,
              key: args.key));
    },
    AddProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddProductRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i21.AddProductPage(
              args.providerID, args.cate, args.sName, args.pName, args.type,
              key: args.key));
    },
    PermissionRoute.name: (routeData) {
      return _i28.AdaptivePage<void>(
          routeData: routeData, child: const _i22.PermissionPage());
    },
    MapRouteRoute.name: (routeData) {
      final args = routeData.argsAs<MapRouteRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i23.MapRoutePage(
              key: args.key,
              recordId: args.recordId,
              consumerId: args.consumerId));
    },
    ChangeLanguageRoute.name: (routeData) {
      return _i28.AdaptivePage<void>(
          routeData: routeData, child: const _i24.ChangeLanguagePage());
    },
    CommonServiceRoute.name: (routeData) {
      final args = routeData.argsAs<CommonServiceRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i25.CommonServicePage(args.providerID, args.sortType,
              key: args.key));
    },
    CommonProductRoute.name: (routeData) {
      final args = routeData.argsAs<CommonProductRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i26.CommonProductPage(args.products, args.complete,
              key: args.key));
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData, child: _i27.HomePage(args.user, key: args.key));
    },
    HomePrimaryRoute.name: (routeData) {
      final args = routeData.argsAs<HomePrimaryRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i27.HomePrimaryPage(args.user, key: args.key));
    },
    HistoryProviderRoute.name: (routeData) {
      return _i28.AdaptivePage<void>(
          routeData: routeData, child: const _i27.HistoryProviderPage());
    },
    NotificationProviderRoute.name: (routeData) {
      return _i28.AdaptivePage<void>(
          routeData: routeData, child: const _i27.NotificationProviderPage());
    },
    AccountRoute.name: (routeData) {
      final args = routeData.argsAs<AccountRouteArgs>();
      return _i28.AdaptivePage<void>(
          routeData: routeData,
          child: _i27.AccountPage(args.user, key: args.key));
    }
  };

  @override
  List<_i28.RouteConfig> get routes => [
        _i28.RouteConfig(SplashRoute.name, path: '/'),
        _i28.RouteConfig(AnalyticsRoute.name, path: '/analytics-page'),
        _i28.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i28.RouteConfig(P3RequestDetailRoute.name,
            path: '/p3-request-detail-page'),
        _i28.RouteConfig(InfoRequestRoute.name, path: '/info-request-page'),
        _i28.RouteConfig(P14RepairCompleteRoute.name,
            path: '/p14-repair-complete-page'),
        _i28.RouteConfig(P13SelectOptionCompleteRoute.name,
            path: '/p13-select-option-complete-page'),
        _i28.RouteConfig(P16FinishedOrderDetailRoute.name,
            path: '/p16-finished-order-detail-page'),
        _i28.RouteConfig(AddServiceRoute.name, path: '/add-service-page'),
        _i28.RouteConfig(MyReviewRoute.name, path: '/my-review-page'),
        _i28.RouteConfig(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page'),
        _i28.RouteConfig(ListServiceRoute.name, path: '/list-service-page'),
        _i28.RouteConfig(DetailServiceRoute.name, path: '/detail-service-page'),
        _i28.RouteConfig(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page'),
        _i28.RouteConfig(SignupRoute.name, path: '/signup-page'),
        _i28.RouteConfig(OTPRoute.name, path: '/o-tp-page'),
        _i28.RouteConfig(TestRoute.name, path: '/test-page'),
        _i28.RouteConfig(LoginEnterPhoneRoute.name,
            path: '/login-enter-phone-page'),
        _i28.RouteConfig(NewRequestRoute.name, path: '/new-request-page'),
        _i28.RouteConfig(P12DetailRoute.name, path: '/p12-detail-page'),
        _i28.RouteConfig(P10QuotePriceRoute.name,
            path: '/p10-quote-price-page'),
        _i28.RouteConfig(UpdateServiceRoute.name, path: '/update-service-page'),
        _i28.RouteConfig(AddProductRoute.name, path: '/add-product-page'),
        _i28.RouteConfig(PermissionRoute.name, path: '/permission-page'),
        _i28.RouteConfig(MapRouteRoute.name, path: '/map-route-page'),
        _i28.RouteConfig(ChangeLanguageRoute.name,
            path: '/change-language-page'),
        _i28.RouteConfig(CommonServiceRoute.name, path: '/common-service-page'),
        _i28.RouteConfig(CommonProductRoute.name, path: '/common-product-page'),
        _i28.RouteConfig(HomeRoute.name, path: '/home-page', children: [
          _i28.RouteConfig(HomePrimaryRoute.name,
              path: 'home-primary-page', parent: HomeRoute.name),
          _i28.RouteConfig(HistoryProviderRoute.name,
              path: 'history-provider-page', parent: HomeRoute.name),
          _i28.RouteConfig(NotificationProviderRoute.name,
              path: 'notification-provider-page', parent: HomeRoute.name),
          _i28.RouteConfig(AccountRoute.name,
              path: 'account-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i28.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AnalyticsPage]
class AnalyticsRoute extends _i28.PageRouteInfo<AnalyticsRouteArgs> {
  AnalyticsRoute({required String providerID, _i29.Key? key})
      : super(AnalyticsRoute.name,
            path: '/analytics-page',
            args: AnalyticsRouteArgs(providerID: providerID, key: key));

  static const String name = 'AnalyticsRoute';
}

class AnalyticsRouteArgs {
  const AnalyticsRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i29.Key? key;

  @override
  String toString() {
    return 'AnalyticsRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i28.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.P3RequestDetailPage]
class P3RequestDetailRoute
    extends _i28.PageRouteInfo<P3RequestDetailRouteArgs> {
  P3RequestDetailRoute(
      {_i29.Key? key,
      required _i30.PendingRepairRequest record,
      required _i31.IList<_i7.PendingServiceModel> pendingService,
      required List<_i7.NeedToVerifyModel> needToVerify,
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

  final _i29.Key? key;

  final _i30.PendingRepairRequest record;

  final _i31.IList<_i7.PendingServiceModel> pendingService;

  final List<_i7.NeedToVerifyModel> needToVerify;

  final int pendingAmount;

  @override
  String toString() {
    return 'P3RequestDetailRouteArgs{key: $key, record: $record, pendingService: $pendingService, needToVerify: $needToVerify, pendingAmount: $pendingAmount}';
  }
}

/// generated route for
/// [_i5.InfoRequestPage]
class InfoRequestRoute extends _i28.PageRouteInfo<InfoRequestRouteArgs> {
  InfoRequestRoute(
      {_i29.Key? key,
      required _i32.AppUser consumer,
      required String recordId,
      required double distance,
      required _i31.IList<_i7.PendingServiceModel> pendingService,
      required int pendingAmount})
      : super(InfoRequestRoute.name,
            path: '/info-request-page',
            args: InfoRequestRouteArgs(
                key: key,
                consumer: consumer,
                recordId: recordId,
                distance: distance,
                pendingService: pendingService,
                pendingAmount: pendingAmount));

  static const String name = 'InfoRequestRoute';
}

class InfoRequestRouteArgs {
  const InfoRequestRouteArgs(
      {this.key,
      required this.consumer,
      required this.recordId,
      required this.distance,
      required this.pendingService,
      required this.pendingAmount});

  final _i29.Key? key;

  final _i32.AppUser consumer;

  final String recordId;

  final double distance;

  final _i31.IList<_i7.PendingServiceModel> pendingService;

  final int pendingAmount;

  @override
  String toString() {
    return 'InfoRequestRouteArgs{key: $key, consumer: $consumer, recordId: $recordId, distance: $distance, pendingService: $pendingService, pendingAmount: $pendingAmount}';
  }
}

/// generated route for
/// [_i6.P14RepairCompletePage]
class P14RepairCompleteRoute
    extends _i28.PageRouteInfo<P14RepairCompleteRouteArgs> {
  P14RepairCompleteRoute(
      {_i29.Key? key,
      required List<_i7.PendingServiceModel> finished,
      required List<_i7.PaidServicesModel> paid,
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

  final _i29.Key? key;

  final List<_i7.PendingServiceModel> finished;

  final List<_i7.PaidServicesModel> paid;

  final String vehicle;

  final String recordId;

  @override
  String toString() {
    return 'P14RepairCompleteRouteArgs{key: $key, finished: $finished, paid: $paid, vehicle: $vehicle, recordId: $recordId}';
  }
}

/// generated route for
/// [_i7.P13SelectOptionCompletePage]
class P13SelectOptionCompleteRoute
    extends _i28.PageRouteInfo<P13SelectOptionCompleteRouteArgs> {
  P13SelectOptionCompleteRoute(
      {_i29.Key? key,
      required String id,
      required List<_i7.PaidServicesModel> paid,
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

  final _i29.Key? key;

  final String id;

  final List<_i7.PaidServicesModel> paid;

  final String vehicle;

  @override
  String toString() {
    return 'P13SelectOptionCompleteRouteArgs{key: $key, id: $id, paid: $paid, vehicle: $vehicle}';
  }
}

/// generated route for
/// [_i8.P16FinishedOrderDetailPage]
class P16FinishedOrderDetailRoute
    extends _i28.PageRouteInfo<P16FinishedOrderDetailRouteArgs> {
  P16FinishedOrderDetailRoute(
      {_i29.Key? key,
      required _i31.Tuple2<List<_i7.PendingServiceModel>,
              List<_i7.PaidServicesModel>>
          data})
      : super(P16FinishedOrderDetailRoute.name,
            path: '/p16-finished-order-detail-page',
            args: P16FinishedOrderDetailRouteArgs(key: key, data: data));

  static const String name = 'P16FinishedOrderDetailRoute';
}

class P16FinishedOrderDetailRouteArgs {
  const P16FinishedOrderDetailRouteArgs({this.key, required this.data});

  final _i29.Key? key;

  final _i31.Tuple2<List<_i7.PendingServiceModel>, List<_i7.PaidServicesModel>>
      data;

  @override
  String toString() {
    return 'P16FinishedOrderDetailRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i9.AddServicePage]
class AddServiceRoute extends _i28.PageRouteInfo<AddServiceRouteArgs> {
  AddServiceRoute({required String providerID, _i29.Key? key})
      : super(AddServiceRoute.name,
            path: '/add-service-page',
            args: AddServiceRouteArgs(providerID: providerID, key: key));

  static const String name = 'AddServiceRoute';
}

class AddServiceRouteArgs {
  const AddServiceRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i29.Key? key;

  @override
  String toString() {
    return 'AddServiceRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i10.MyReviewPage]
class MyReviewRoute extends _i28.PageRouteInfo<MyReviewRouteArgs> {
  MyReviewRoute({required String providerID, _i29.Key? key})
      : super(MyReviewRoute.name,
            path: '/my-review-page',
            args: MyReviewRouteArgs(providerID: providerID, key: key));

  static const String name = 'MyReviewRoute';
}

class MyReviewRouteArgs {
  const MyReviewRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i29.Key? key;

  @override
  String toString() {
    return 'MyReviewRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i11.VendorAuthenticationPage]
class VendorAuthenticationRoute
    extends _i28.PageRouteInfo<VendorAuthenticationRouteArgs> {
  VendorAuthenticationRoute({required _i32.AppUser user, _i29.Key? key})
      : super(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page',
            args: VendorAuthenticationRouteArgs(user: user, key: key));

  static const String name = 'VendorAuthenticationRoute';
}

class VendorAuthenticationRouteArgs {
  const VendorAuthenticationRouteArgs({required this.user, this.key});

  final _i32.AppUser user;

  final _i29.Key? key;

  @override
  String toString() {
    return 'VendorAuthenticationRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i9.ListServicePage]
class ListServiceRoute extends _i28.PageRouteInfo<ListServiceRouteArgs> {
  ListServiceRoute({required String providerID, _i29.Key? key})
      : super(ListServiceRoute.name,
            path: '/list-service-page',
            args: ListServiceRouteArgs(providerID: providerID, key: key));

  static const String name = 'ListServiceRoute';
}

class ListServiceRouteArgs {
  const ListServiceRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i29.Key? key;

  @override
  String toString() {
    return 'ListServiceRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i9.DetailServicePage]
class DetailServiceRoute extends _i28.PageRouteInfo<DetailServiceRouteArgs> {
  DetailServiceRoute(
      {required String providerID,
      required String serviceName,
      required String category,
      _i29.Key? key})
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

  final _i29.Key? key;

  @override
  String toString() {
    return 'DetailServiceRouteArgs{providerID: $providerID, serviceName: $serviceName, category: $category, key: $key}';
  }
}

/// generated route for
/// [_i12.HistoryProviderDetailPage]
class HistoryProviderDetailRoute
    extends _i28.PageRouteInfo<HistoryProviderDetailRouteArgs> {
  HistoryProviderDetailRoute({required String rpID, _i29.Key? key})
      : super(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page',
            args: HistoryProviderDetailRouteArgs(rpID: rpID, key: key));

  static const String name = 'HistoryProviderDetailRoute';
}

class HistoryProviderDetailRouteArgs {
  const HistoryProviderDetailRouteArgs({required this.rpID, this.key});

  final String rpID;

  final _i29.Key? key;

  @override
  String toString() {
    return 'HistoryProviderDetailRouteArgs{rpID: $rpID, key: $key}';
  }
}

/// generated route for
/// [_i13.SignupPage]
class SignupRoute extends _i28.PageRouteInfo<SignupRouteArgs> {
  SignupRoute(
      {required _i33.Completer<_i32.AppUser> completer,
      required String phoneNumber,
      required String photoURL,
      required String uid,
      required String email,
      _i29.Key? key})
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

  final _i33.Completer<_i32.AppUser> completer;

  final String phoneNumber;

  final String photoURL;

  final String uid;

  final String email;

  final _i29.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{completer: $completer, phoneNumber: $phoneNumber, photoURL: $photoURL, uid: $uid, email: $email, key: $key}';
  }
}

/// generated route for
/// [_i14.OTPPage]
class OTPRoute extends _i28.PageRouteInfo<OTPRouteArgs> {
  OTPRoute(
      {required String phoneNumber,
      required _i33.Completer<String> completer,
      _i29.Key? key})
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

  final _i33.Completer<String> completer;

  final _i29.Key? key;

  @override
  String toString() {
    return 'OTPRouteArgs{phoneNumber: $phoneNumber, completer: $completer, key: $key}';
  }
}

/// generated route for
/// [_i15.TestPage]
class TestRoute extends _i28.PageRouteInfo<TestRouteArgs> {
  TestRoute({required String providerID, required int sortType, _i29.Key? key})
      : super(TestRoute.name,
            path: '/test-page',
            args: TestRouteArgs(
                providerID: providerID, sortType: sortType, key: key));

  static const String name = 'TestRoute';
}

class TestRouteArgs {
  const TestRouteArgs(
      {required this.providerID, required this.sortType, this.key});

  final String providerID;

  final int sortType;

  final _i29.Key? key;

  @override
  String toString() {
    return 'TestRouteArgs{providerID: $providerID, sortType: $sortType, key: $key}';
  }
}

/// generated route for
/// [_i16.LoginEnterPhonePage]
class LoginEnterPhoneRoute
    extends _i28.PageRouteInfo<LoginEnterPhoneRouteArgs> {
  LoginEnterPhoneRoute(
      {required _i33.Completer<_i32.AppUser> completer,
      required String phoneNumber,
      required String photoURL,
      required String uid,
      required String email,
      _i29.Key? key})
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

  final _i33.Completer<_i32.AppUser> completer;

  final String phoneNumber;

  final String photoURL;

  final String uid;

  final String email;

  final _i29.Key? key;

  @override
  String toString() {
    return 'LoginEnterPhoneRouteArgs{completer: $completer, phoneNumber: $phoneNumber, photoURL: $photoURL, uid: $uid, email: $email, key: $key}';
  }
}

/// generated route for
/// [_i17.NewRequestPage]
class NewRequestRoute extends _i28.PageRouteInfo<NewRequestRouteArgs> {
  NewRequestRoute({_i29.Key? key, required String recordId})
      : super(NewRequestRoute.name,
            path: '/new-request-page',
            args: NewRequestRouteArgs(key: key, recordId: recordId));

  static const String name = 'NewRequestRoute';
}

class NewRequestRouteArgs {
  const NewRequestRouteArgs({this.key, required this.recordId});

  final _i29.Key? key;

  final String recordId;

  @override
  String toString() {
    return 'NewRequestRouteArgs{key: $key, recordId: $recordId}';
  }
}

/// generated route for
/// [_i18.P12DetailPage]
class P12DetailRoute extends _i28.PageRouteInfo<P12DetailRouteArgs> {
  P12DetailRoute({_i29.Key? key, required String recordId})
      : super(P12DetailRoute.name,
            path: '/p12-detail-page',
            args: P12DetailRouteArgs(key: key, recordId: recordId));

  static const String name = 'P12DetailRoute';
}

class P12DetailRouteArgs {
  const P12DetailRouteArgs({this.key, required this.recordId});

  final _i29.Key? key;

  final String recordId;

  @override
  String toString() {
    return 'P12DetailRouteArgs{key: $key, recordId: $recordId}';
  }
}

/// generated route for
/// [_i19.P10QuotePricePage]
class P10QuotePriceRoute extends _i28.PageRouteInfo<P10QuotePriceRouteArgs> {
  P10QuotePriceRoute(
      {_i29.Key? key,
      required _i30.PendingRepairRequest record,
      required _i31.IList<_i7.PendingServiceModel> pendingService,
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

  final _i29.Key? key;

  final _i30.PendingRepairRequest record;

  final _i31.IList<_i7.PendingServiceModel> pendingService;

  final int pendingAmount;

  @override
  String toString() {
    return 'P10QuotePriceRouteArgs{key: $key, record: $record, pendingService: $pendingService, pendingAmount: $pendingAmount}';
  }
}

/// generated route for
/// [_i20.UpdateServicePage]
class UpdateServiceRoute extends _i28.PageRouteInfo<UpdateServiceRouteArgs> {
  UpdateServiceRoute(
      {required String providerID,
      required String category,
      required String sName,
      _i29.Key? key})
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

  final _i29.Key? key;

  @override
  String toString() {
    return 'UpdateServiceRouteArgs{providerID: $providerID, category: $category, sName: $sName, key: $key}';
  }
}

/// generated route for
/// [_i21.AddProductPage]
class AddProductRoute extends _i28.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute(
      {required String providerID,
      required String cate,
      required String sName,
      required String pName,
      required int type,
      _i29.Key? key})
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

  final _i29.Key? key;

  @override
  String toString() {
    return 'AddProductRouteArgs{providerID: $providerID, cate: $cate, sName: $sName, pName: $pName, type: $type, key: $key}';
  }
}

/// generated route for
/// [_i22.PermissionPage]
class PermissionRoute extends _i28.PageRouteInfo<void> {
  const PermissionRoute()
      : super(PermissionRoute.name, path: '/permission-page');

  static const String name = 'PermissionRoute';
}

/// generated route for
/// [_i23.MapRoutePage]
class MapRouteRoute extends _i28.PageRouteInfo<MapRouteRouteArgs> {
  MapRouteRoute(
      {_i29.Key? key, required String recordId, required String consumerId})
      : super(MapRouteRoute.name,
            path: '/map-route-page',
            args: MapRouteRouteArgs(
                key: key, recordId: recordId, consumerId: consumerId));

  static const String name = 'MapRouteRoute';
}

class MapRouteRouteArgs {
  const MapRouteRouteArgs(
      {this.key, required this.recordId, required this.consumerId});

  final _i29.Key? key;

  final String recordId;

  final String consumerId;

  @override
  String toString() {
    return 'MapRouteRouteArgs{key: $key, recordId: $recordId, consumerId: $consumerId}';
  }
}

/// generated route for
/// [_i24.ChangeLanguagePage]
class ChangeLanguageRoute extends _i28.PageRouteInfo<void> {
  const ChangeLanguageRoute()
      : super(ChangeLanguageRoute.name, path: '/change-language-page');

  static const String name = 'ChangeLanguageRoute';
}

/// generated route for
/// [_i25.CommonServicePage]
class CommonServiceRoute extends _i28.PageRouteInfo<CommonServiceRouteArgs> {
  CommonServiceRoute(
      {required String providerID, required int sortType, _i29.Key? key})
      : super(CommonServiceRoute.name,
            path: '/common-service-page',
            args: CommonServiceRouteArgs(
                providerID: providerID, sortType: sortType, key: key));

  static const String name = 'CommonServiceRoute';
}

class CommonServiceRouteArgs {
  const CommonServiceRouteArgs(
      {required this.providerID, required this.sortType, this.key});

  final String providerID;

  final int sortType;

  final _i29.Key? key;

  @override
  String toString() {
    return 'CommonServiceRouteArgs{providerID: $providerID, sortType: $sortType, key: $key}';
  }
}

/// generated route for
/// [_i26.CommonProductPage]
class CommonProductRoute extends _i28.PageRouteInfo<CommonProductRouteArgs> {
  CommonProductRoute(
      {required List<_i32.RepairProduct> products,
      required _i33.Completer<List<_i31.Tuple2<_i32.RepairProduct, _i34.File>>>
          complete,
      _i29.Key? key})
      : super(CommonProductRoute.name,
            path: '/common-product-page',
            args: CommonProductRouteArgs(
                products: products, complete: complete, key: key));

  static const String name = 'CommonProductRoute';
}

class CommonProductRouteArgs {
  const CommonProductRouteArgs(
      {required this.products, required this.complete, this.key});

  final List<_i32.RepairProduct> products;

  final _i33.Completer<List<_i31.Tuple2<_i32.RepairProduct, _i34.File>>>
      complete;

  final _i29.Key? key;

  @override
  String toString() {
    return 'CommonProductRouteArgs{products: $products, complete: $complete, key: $key}';
  }
}

/// generated route for
/// [_i27.HomePage]
class HomeRoute extends _i28.PageRouteInfo<HomeRouteArgs> {
  HomeRoute(
      {required _i32.AppUser user,
      _i29.Key? key,
      List<_i28.PageRouteInfo>? children})
      : super(HomeRoute.name,
            path: '/home-page',
            args: HomeRouteArgs(user: user, key: key),
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({required this.user, this.key});

  final _i32.AppUser user;

  final _i29.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i27.HomePrimaryPage]
class HomePrimaryRoute extends _i28.PageRouteInfo<HomePrimaryRouteArgs> {
  HomePrimaryRoute({required _i32.AppUser user, _i29.Key? key})
      : super(HomePrimaryRoute.name,
            path: 'home-primary-page',
            args: HomePrimaryRouteArgs(user: user, key: key));

  static const String name = 'HomePrimaryRoute';
}

class HomePrimaryRouteArgs {
  const HomePrimaryRouteArgs({required this.user, this.key});

  final _i32.AppUser user;

  final _i29.Key? key;

  @override
  String toString() {
    return 'HomePrimaryRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i27.HistoryProviderPage]
class HistoryProviderRoute extends _i28.PageRouteInfo<void> {
  const HistoryProviderRoute()
      : super(HistoryProviderRoute.name, path: 'history-provider-page');

  static const String name = 'HistoryProviderRoute';
}

/// generated route for
/// [_i27.NotificationProviderPage]
class NotificationProviderRoute extends _i28.PageRouteInfo<void> {
  const NotificationProviderRoute()
      : super(NotificationProviderRoute.name,
            path: 'notification-provider-page');

  static const String name = 'NotificationProviderRoute';
}

/// generated route for
/// [_i27.AccountPage]
class AccountRoute extends _i28.PageRouteInfo<AccountRouteArgs> {
  AccountRoute({required _i32.AppUser user, _i29.Key? key})
      : super(AccountRoute.name,
            path: 'account-page', args: AccountRouteArgs(user: user, key: key));

  static const String name = 'AccountRoute';
}

class AccountRouteArgs {
  const AccountRouteArgs({required this.user, this.key});

  final _i32.AppUser user;

  final _i29.Key? key;

  @override
  String toString() {
    return 'AccountRouteArgs{user: $user, key: $key}';
  }
}
