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
import 'dart:async' as _i37;
import 'dart:io' as _i38;

import 'package:auto_route/auto_route.dart' as _i32;
import 'package:dartz/dartz.dart' as _i35;
import 'package:flutter/material.dart' as _i33;
import 'package:revup_core/core.dart' as _i34;
import 'package:revup_provider/analytics/view/analytics_page.dart' as _i2;
import 'package:revup_provider/change_language/view/change_language_page.dart'
    as _i28;
import 'package:revup_provider/common_product/view/common_product_page.dart'
    as _i30;
import 'package:revup_provider/common_service/view/common_service_page.dart'
    as _i29;
import 'package:revup_provider/guide-support/view/about_us_page.u.dart' as _i16;
import 'package:revup_provider/guide-support/view/faqs_page.u.dart' as _i17;
import 'package:revup_provider/guide-support/view/terms_privacy_page.u.dart'
    as _i19;
import 'package:revup_provider/guide-support/widgets/faqs_item_otp.u.dart'
    as _i18;
import 'package:revup_provider/home/home.dart' as _i31;
import 'package:revup_provider/home/modules/history/history_provider_detail/view/history_detail_page.u.dart'
    as _i13;
import 'package:revup_provider/login/login_enter_phone/view/login_enter_phone_number_page.u.dart'
    as _i20;
import 'package:revup_provider/login/view/login_page.u.dart' as _i3;
import 'package:revup_provider/map_route/view/map_route_page.dart' as _i27;
import 'package:revup_provider/my_review/my_review.dart' as _i11;
import 'package:revup_provider/new_request/models/pending_repair_request.dart'
    as _i36;
import 'package:revup_provider/new_request/view/new_request_page.dart' as _i21;
import 'package:revup_provider/otp/view/otp_page.u.dart' as _i15;
import 'package:revup_provider/permission_page/permission_page.u.dart' as _i26;
import 'package:revup_provider/repair_request/modules/p10_quote_price/view/p10_quote_price_page.dart'
    as _i23;
import 'package:revup_provider/repair_request/modules/p12_detail_order/view/p12_detail_page.u.dart'
    as _i22;
import 'package:revup_provider/repair_request/modules/p14_repair_completed/view/p14_repair_completed_page.u.dart'
    as _i7;
import 'package:revup_provider/repair_request/modules/p16_finished_order_detail/view/p16_finished_order_detail_page.u.dart'
    as _i9;
import 'package:revup_provider/repair_request/modules/p3_request_detail/view/p3_request_detail.u.dart'
    as _i5;
import 'package:revup_provider/repair_request/modules/p4_info_request/view/info_request_page.u.dart'
    as _i6;
import 'package:revup_provider/repair_request/modules/p4_start_repair/view/start_repair_page.u.dart'
    as _i4;
import 'package:revup_provider/repair_request/request.dart' as _i8;
import 'package:revup_provider/repair_service/add-product/view/add_product_page.u.dart'
    as _i25;
import 'package:revup_provider/repair_service/repair_service.dart' as _i10;
import 'package:revup_provider/repair_service/update_service/view/view.dart'
    as _i24;
import 'package:revup_provider/signup/view/signup_page.u.dart' as _i14;
import 'package:revup_provider/splash/splash.dart' as _i1;
import 'package:revup_provider/vendor_authentication/vender_authentication.dart'
    as _i12;

class AppRouter extends _i32.RootStackRouter {
  AppRouter([_i33.GlobalKey<_i33.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i32.AdaptivePage<void>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    AnalyticsRoute.name: (routeData) {
      final args = routeData.argsAs<AnalyticsRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i2.AnalyticsPage(args.providerID, key: args.key));
    },
    LoginRoute.name: (routeData) {
      return _i32.AdaptivePage<void>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    StartRepairRoute.name: (routeData) {
      final args = routeData.argsAs<StartRepairRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i4.StartRepairPage(
              key: args.key,
              consumer: args.consumer,
              recordId: args.recordId,
              distance: args.distance,
              pendingService: args.pendingService,
              pendingAmount: args.pendingAmount));
    },
    P3RequestDetailRoute.name: (routeData) {
      final args = routeData.argsAs<P3RequestDetailRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i5.P3RequestDetailPage(
              key: args.key,
              record: args.record,
              pendingService: args.pendingService,
              needToVerify: args.needToVerify,
              pendingAmount: args.pendingAmount));
    },
    InfoRequestRoute.name: (routeData) {
      final args = routeData.argsAs<InfoRequestRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i6.InfoRequestPage(
              key: args.key,
              consumer: args.consumer,
              recordId: args.recordId,
              distance: args.distance,
              pendingService: args.pendingService,
              pendingAmount: args.pendingAmount));
    },
    P14RepairCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<P14RepairCompleteRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i7.P14RepairCompletePage(
              key: args.key,
              finished: args.finished,
              paid: args.paid,
              vehicle: args.vehicle,
              recordId: args.recordId));
    },
    P13SelectOptionCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<P13SelectOptionCompleteRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i8.P13SelectOptionCompletePage(
              key: args.key,
              id: args.id,
              services: args.services,
              vehicle: args.vehicle));
    },
    P16FinishedOrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<P16FinishedOrderDetailRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i9.P16FinishedOrderDetailPage(
              key: args.key, services: args.services));
    },
    AddServiceRoute.name: (routeData) {
      final args = routeData.argsAs<AddServiceRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i10.AddServicePage(args.providerID, key: args.key));
    },
    MyReviewRoute.name: (routeData) {
      final args = routeData.argsAs<MyReviewRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i11.MyReviewPage(args.providerID, key: args.key));
    },
    VendorAuthenticationRoute.name: (routeData) {
      final args = routeData.argsAs<VendorAuthenticationRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i12.VendorAuthenticationPage(args.user, key: args.key));
    },
    ListServiceRoute.name: (routeData) {
      final args = routeData.argsAs<ListServiceRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i10.ListServicePage(args.providerID, key: args.key));
    },
    DetailServiceRoute.name: (routeData) {
      final args = routeData.argsAs<DetailServiceRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i10.DetailServicePage(
              args.providerID, args.serviceName, args.category,
              key: args.key));
    },
    HistoryProviderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryProviderDetailRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i13.HistoryProviderDetailPage(args.rpID, key: args.key));
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i14.SignupPage(args.completer, args.phoneNumber,
              args.photoURL, args.uid, args.email,
              key: args.key));
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i15.OTPPage(args.phoneNumber, args.completer, key: args.key));
    },
    AboutUsRoute.name: (routeData) {
      return _i32.AdaptivePage<void>(
          routeData: routeData, child: const _i16.AboutUsPage());
    },
    FAQsRoute.name: (routeData) {
      return _i32.AdaptivePage<void>(
          routeData: routeData, child: const _i17.FAQsPage());
    },
    FAQsItemOTPRoute.name: (routeData) {
      return _i32.AdaptivePage<void>(
          routeData: routeData, child: const _i18.FAQsItemOTPPage());
    },
    TermsPrivacyRoute.name: (routeData) {
      return _i32.AdaptivePage<void>(
          routeData: routeData, child: const _i19.TermsPrivacyPage());
    },
    LoginEnterPhoneRoute.name: (routeData) {
      final args = routeData.argsAs<LoginEnterPhoneRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i20.LoginEnterPhonePage(args.completer, args.phoneNumber,
              args.photoURL, args.uid, args.email,
              key: args.key));
    },
    NewRequestRoute.name: (routeData) {
      final args = routeData.argsAs<NewRequestRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i21.NewRequestPage(key: args.key, recordId: args.recordId));
    },
    P12DetailRoute.name: (routeData) {
      final args = routeData.argsAs<P12DetailRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i22.P12DetailPage(key: args.key, recordId: args.recordId));
    },
    P10QuotePriceRoute.name: (routeData) {
      final args = routeData.argsAs<P10QuotePriceRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i23.P10QuotePricePage(
              key: args.key,
              record: args.record,
              pendingService: args.pendingService,
              pendingAmount: args.pendingAmount));
    },
    UpdateServiceRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateServiceRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i24.UpdateServicePage(
              args.providerID, args.category, args.sName,
              key: args.key));
    },
    AddProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddProductRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i25.AddProductPage(
              args.providerID, args.cate, args.sName, args.pName, args.type,
              key: args.key));
    },
    PermissionRoute.name: (routeData) {
      return _i32.AdaptivePage<void>(
          routeData: routeData, child: const _i26.PermissionPage());
    },
    MapRouteRoute.name: (routeData) {
      final args = routeData.argsAs<MapRouteRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i27.MapRoutePage(
              key: args.key,
              recordId: args.recordId,
              consumerId: args.consumerId,
              consumer: args.consumer,
              distance: args.distance,
              pendingService: args.pendingService,
              pendingAmount: args.pendingAmount));
    },
    ChangeLanguageRoute.name: (routeData) {
      return _i32.AdaptivePage<void>(
          routeData: routeData, child: const _i28.ChangeLanguagePage());
    },
    CommonServiceRoute.name: (routeData) {
      final args = routeData.argsAs<CommonServiceRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i29.CommonServicePage(args.providerID, args.sortType,
              key: args.key));
    },
    CommonProductRoute.name: (routeData) {
      final args = routeData.argsAs<CommonProductRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i30.CommonProductPage(args.products, args.complete,
              key: args.key));
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData, child: _i31.HomePage(args.user, key: args.key));
    },
    HomePrimaryRoute.name: (routeData) {
      final args = routeData.argsAs<HomePrimaryRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i31.HomePrimaryPage(args.user, key: args.key));
    },
    HistoryProviderRoute.name: (routeData) {
      return _i32.AdaptivePage<void>(
          routeData: routeData, child: const _i31.HistoryProviderPage());
    },
    NotificationProviderRoute.name: (routeData) {
      return _i32.AdaptivePage<void>(
          routeData: routeData, child: const _i31.NotificationProviderPage());
    },
    AccountRoute.name: (routeData) {
      final args = routeData.argsAs<AccountRouteArgs>();
      return _i32.AdaptivePage<void>(
          routeData: routeData,
          child: _i31.AccountPage(args.user, key: args.key));
    }
  };

  @override
  List<_i32.RouteConfig> get routes => [
        _i32.RouteConfig(SplashRoute.name, path: '/'),
        _i32.RouteConfig(AnalyticsRoute.name, path: '/analytics-page'),
        _i32.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i32.RouteConfig(StartRepairRoute.name, path: '/start-repair-page'),
        _i32.RouteConfig(P3RequestDetailRoute.name,
            path: '/p3-request-detail-page'),
        _i32.RouteConfig(InfoRequestRoute.name, path: '/info-request-page'),
        _i32.RouteConfig(P14RepairCompleteRoute.name,
            path: '/p14-repair-complete-page'),
        _i32.RouteConfig(P13SelectOptionCompleteRoute.name,
            path: '/p13-select-option-complete-page'),
        _i32.RouteConfig(P16FinishedOrderDetailRoute.name,
            path: '/p16-finished-order-detail-page'),
        _i32.RouteConfig(AddServiceRoute.name, path: '/add-service-page'),
        _i32.RouteConfig(MyReviewRoute.name, path: '/my-review-page'),
        _i32.RouteConfig(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page'),
        _i32.RouteConfig(ListServiceRoute.name, path: '/list-service-page'),
        _i32.RouteConfig(DetailServiceRoute.name, path: '/detail-service-page'),
        _i32.RouteConfig(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page'),
        _i32.RouteConfig(SignupRoute.name, path: '/signup-page'),
        _i32.RouteConfig(OTPRoute.name, path: '/o-tp-page'),
        _i32.RouteConfig(AboutUsRoute.name, path: '/about-us-page'),
        _i32.RouteConfig(FAQsRoute.name, path: '/f-aqs-page'),
        _i32.RouteConfig(FAQsItemOTPRoute.name, path: '/f-aqs-item-ot-pPage'),
        _i32.RouteConfig(TermsPrivacyRoute.name, path: '/terms-privacy-page'),
        _i32.RouteConfig(LoginEnterPhoneRoute.name,
            path: '/login-enter-phone-page'),
        _i32.RouteConfig(NewRequestRoute.name, path: '/new-request-page'),
        _i32.RouteConfig(P12DetailRoute.name, path: '/p12-detail-page'),
        _i32.RouteConfig(P10QuotePriceRoute.name,
            path: '/p10-quote-price-page'),
        _i32.RouteConfig(UpdateServiceRoute.name, path: '/update-service-page'),
        _i32.RouteConfig(AddProductRoute.name, path: '/add-product-page'),
        _i32.RouteConfig(PermissionRoute.name, path: '/permission-page'),
        _i32.RouteConfig(MapRouteRoute.name, path: '/map-route-page'),
        _i32.RouteConfig(ChangeLanguageRoute.name,
            path: '/change-language-page'),
        _i32.RouteConfig(CommonServiceRoute.name, path: '/common-service-page'),
        _i32.RouteConfig(CommonProductRoute.name, path: '/common-product-page'),
        _i32.RouteConfig(HomeRoute.name, path: '/home-page', children: [
          _i32.RouteConfig(HomePrimaryRoute.name,
              path: 'home-primary-page', parent: HomeRoute.name),
          _i32.RouteConfig(HistoryProviderRoute.name,
              path: 'history-provider-page', parent: HomeRoute.name),
          _i32.RouteConfig(NotificationProviderRoute.name,
              path: 'notification-provider-page', parent: HomeRoute.name),
          _i32.RouteConfig(AccountRoute.name,
              path: 'account-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i32.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AnalyticsPage]
class AnalyticsRoute extends _i32.PageRouteInfo<AnalyticsRouteArgs> {
  AnalyticsRoute({required String providerID, _i33.Key? key})
      : super(AnalyticsRoute.name,
            path: '/analytics-page',
            args: AnalyticsRouteArgs(providerID: providerID, key: key));

  static const String name = 'AnalyticsRoute';
}

class AnalyticsRouteArgs {
  const AnalyticsRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i33.Key? key;

  @override
  String toString() {
    return 'AnalyticsRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i32.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.StartRepairPage]
class StartRepairRoute extends _i32.PageRouteInfo<StartRepairRouteArgs> {
  StartRepairRoute(
      {_i33.Key? key,
      required _i34.AppUser consumer,
      required String recordId,
      required double distance,
      required _i35.IList<_i8.PendingServiceModel> pendingService,
      required int pendingAmount})
      : super(StartRepairRoute.name,
            path: '/start-repair-page',
            args: StartRepairRouteArgs(
                key: key,
                consumer: consumer,
                recordId: recordId,
                distance: distance,
                pendingService: pendingService,
                pendingAmount: pendingAmount));

  static const String name = 'StartRepairRoute';
}

class StartRepairRouteArgs {
  const StartRepairRouteArgs(
      {this.key,
      required this.consumer,
      required this.recordId,
      required this.distance,
      required this.pendingService,
      required this.pendingAmount});

  final _i33.Key? key;

  final _i34.AppUser consumer;

  final String recordId;

  final double distance;

  final _i35.IList<_i8.PendingServiceModel> pendingService;

  final int pendingAmount;

  @override
  String toString() {
    return 'StartRepairRouteArgs{key: $key, consumer: $consumer, recordId: $recordId, distance: $distance, pendingService: $pendingService, pendingAmount: $pendingAmount}';
  }
}

/// generated route for
/// [_i5.P3RequestDetailPage]
class P3RequestDetailRoute
    extends _i32.PageRouteInfo<P3RequestDetailRouteArgs> {
  P3RequestDetailRoute(
      {_i33.Key? key,
      required _i36.PendingRepairRequest record,
      required _i35.IList<_i8.PendingServiceModel> pendingService,
      required List<_i8.NeedToVerifyModel> needToVerify,
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

  final _i33.Key? key;

  final _i36.PendingRepairRequest record;

  final _i35.IList<_i8.PendingServiceModel> pendingService;

  final List<_i8.NeedToVerifyModel> needToVerify;

  final int pendingAmount;

  @override
  String toString() {
    return 'P3RequestDetailRouteArgs{key: $key, record: $record, pendingService: $pendingService, needToVerify: $needToVerify, pendingAmount: $pendingAmount}';
  }
}

/// generated route for
/// [_i6.InfoRequestPage]
class InfoRequestRoute extends _i32.PageRouteInfo<InfoRequestRouteArgs> {
  InfoRequestRoute(
      {_i33.Key? key,
      required _i34.AppUser consumer,
      required String recordId,
      required double distance,
      required _i35.IList<_i8.PendingServiceModel> pendingService,
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

  final _i33.Key? key;

  final _i34.AppUser consumer;

  final String recordId;

  final double distance;

  final _i35.IList<_i8.PendingServiceModel> pendingService;

  final int pendingAmount;

  @override
  String toString() {
    return 'InfoRequestRouteArgs{key: $key, consumer: $consumer, recordId: $recordId, distance: $distance, pendingService: $pendingService, pendingAmount: $pendingAmount}';
  }
}

/// generated route for
/// [_i7.P14RepairCompletePage]
class P14RepairCompleteRoute
    extends _i32.PageRouteInfo<P14RepairCompleteRouteArgs> {
  P14RepairCompleteRoute(
      {_i33.Key? key,
      required List<_i8.PendingServiceModel> finished,
      required List<_i8.PaidServicesModel> paid,
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

  final _i33.Key? key;

  final List<_i8.PendingServiceModel> finished;

  final List<_i8.PaidServicesModel> paid;

  final String vehicle;

  final String recordId;

  @override
  String toString() {
    return 'P14RepairCompleteRouteArgs{key: $key, finished: $finished, paid: $paid, vehicle: $vehicle, recordId: $recordId}';
  }
}

/// generated route for
/// [_i8.P13SelectOptionCompletePage]
class P13SelectOptionCompleteRoute
    extends _i32.PageRouteInfo<P13SelectOptionCompleteRouteArgs> {
  P13SelectOptionCompleteRoute(
      {_i33.Key? key,
      required String id,
      required List<_i8.PendingServiceModel> services,
      required String vehicle})
      : super(P13SelectOptionCompleteRoute.name,
            path: '/p13-select-option-complete-page',
            args: P13SelectOptionCompleteRouteArgs(
                key: key, id: id, services: services, vehicle: vehicle));

  static const String name = 'P13SelectOptionCompleteRoute';
}

class P13SelectOptionCompleteRouteArgs {
  const P13SelectOptionCompleteRouteArgs(
      {this.key,
      required this.id,
      required this.services,
      required this.vehicle});

  final _i33.Key? key;

  final String id;

  final List<_i8.PendingServiceModel> services;

  final String vehicle;

  @override
  String toString() {
    return 'P13SelectOptionCompleteRouteArgs{key: $key, id: $id, services: $services, vehicle: $vehicle}';
  }
}

/// generated route for
/// [_i9.P16FinishedOrderDetailPage]
class P16FinishedOrderDetailRoute
    extends _i32.PageRouteInfo<P16FinishedOrderDetailRouteArgs> {
  P16FinishedOrderDetailRoute(
      {_i33.Key? key, required List<_i8.PendingServiceModel> services})
      : super(P16FinishedOrderDetailRoute.name,
            path: '/p16-finished-order-detail-page',
            args:
                P16FinishedOrderDetailRouteArgs(key: key, services: services));

  static const String name = 'P16FinishedOrderDetailRoute';
}

class P16FinishedOrderDetailRouteArgs {
  const P16FinishedOrderDetailRouteArgs({this.key, required this.services});

  final _i33.Key? key;

  final List<_i8.PendingServiceModel> services;

  @override
  String toString() {
    return 'P16FinishedOrderDetailRouteArgs{key: $key, services: $services}';
  }
}

/// generated route for
/// [_i10.AddServicePage]
class AddServiceRoute extends _i32.PageRouteInfo<AddServiceRouteArgs> {
  AddServiceRoute({required String providerID, _i33.Key? key})
      : super(AddServiceRoute.name,
            path: '/add-service-page',
            args: AddServiceRouteArgs(providerID: providerID, key: key));

  static const String name = 'AddServiceRoute';
}

class AddServiceRouteArgs {
  const AddServiceRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i33.Key? key;

  @override
  String toString() {
    return 'AddServiceRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i11.MyReviewPage]
class MyReviewRoute extends _i32.PageRouteInfo<MyReviewRouteArgs> {
  MyReviewRoute({required String providerID, _i33.Key? key})
      : super(MyReviewRoute.name,
            path: '/my-review-page',
            args: MyReviewRouteArgs(providerID: providerID, key: key));

  static const String name = 'MyReviewRoute';
}

class MyReviewRouteArgs {
  const MyReviewRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i33.Key? key;

  @override
  String toString() {
    return 'MyReviewRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i12.VendorAuthenticationPage]
class VendorAuthenticationRoute
    extends _i32.PageRouteInfo<VendorAuthenticationRouteArgs> {
  VendorAuthenticationRoute({required _i34.AppUser user, _i33.Key? key})
      : super(VendorAuthenticationRoute.name,
            path: '/vendor-authentication-page',
            args: VendorAuthenticationRouteArgs(user: user, key: key));

  static const String name = 'VendorAuthenticationRoute';
}

class VendorAuthenticationRouteArgs {
  const VendorAuthenticationRouteArgs({required this.user, this.key});

  final _i34.AppUser user;

  final _i33.Key? key;

  @override
  String toString() {
    return 'VendorAuthenticationRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i10.ListServicePage]
class ListServiceRoute extends _i32.PageRouteInfo<ListServiceRouteArgs> {
  ListServiceRoute({required String providerID, _i33.Key? key})
      : super(ListServiceRoute.name,
            path: '/list-service-page',
            args: ListServiceRouteArgs(providerID: providerID, key: key));

  static const String name = 'ListServiceRoute';
}

class ListServiceRouteArgs {
  const ListServiceRouteArgs({required this.providerID, this.key});

  final String providerID;

  final _i33.Key? key;

  @override
  String toString() {
    return 'ListServiceRouteArgs{providerID: $providerID, key: $key}';
  }
}

/// generated route for
/// [_i10.DetailServicePage]
class DetailServiceRoute extends _i32.PageRouteInfo<DetailServiceRouteArgs> {
  DetailServiceRoute(
      {required String providerID,
      required String serviceName,
      required String category,
      _i33.Key? key})
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

  final _i33.Key? key;

  @override
  String toString() {
    return 'DetailServiceRouteArgs{providerID: $providerID, serviceName: $serviceName, category: $category, key: $key}';
  }
}

/// generated route for
/// [_i13.HistoryProviderDetailPage]
class HistoryProviderDetailRoute
    extends _i32.PageRouteInfo<HistoryProviderDetailRouteArgs> {
  HistoryProviderDetailRoute({required String rpID, _i33.Key? key})
      : super(HistoryProviderDetailRoute.name,
            path: '/history-provider-detail-page',
            args: HistoryProviderDetailRouteArgs(rpID: rpID, key: key));

  static const String name = 'HistoryProviderDetailRoute';
}

class HistoryProviderDetailRouteArgs {
  const HistoryProviderDetailRouteArgs({required this.rpID, this.key});

  final String rpID;

  final _i33.Key? key;

  @override
  String toString() {
    return 'HistoryProviderDetailRouteArgs{rpID: $rpID, key: $key}';
  }
}

/// generated route for
/// [_i14.SignupPage]
class SignupRoute extends _i32.PageRouteInfo<SignupRouteArgs> {
  SignupRoute(
      {required _i37.Completer<_i34.AppUser> completer,
      required String phoneNumber,
      required String photoURL,
      required String uid,
      required String email,
      _i33.Key? key})
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

  final _i37.Completer<_i34.AppUser> completer;

  final String phoneNumber;

  final String photoURL;

  final String uid;

  final String email;

  final _i33.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{completer: $completer, phoneNumber: $phoneNumber, photoURL: $photoURL, uid: $uid, email: $email, key: $key}';
  }
}

/// generated route for
/// [_i15.OTPPage]
class OTPRoute extends _i32.PageRouteInfo<OTPRouteArgs> {
  OTPRoute(
      {required String phoneNumber,
      required _i37.Completer<String> completer,
      _i33.Key? key})
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

  final _i37.Completer<String> completer;

  final _i33.Key? key;

  @override
  String toString() {
    return 'OTPRouteArgs{phoneNumber: $phoneNumber, completer: $completer, key: $key}';
  }
}

/// generated route for
/// [_i16.AboutUsPage]
class AboutUsRoute extends _i32.PageRouteInfo<void> {
  const AboutUsRoute() : super(AboutUsRoute.name, path: '/about-us-page');

  static const String name = 'AboutUsRoute';
}

/// generated route for
/// [_i17.FAQsPage]
class FAQsRoute extends _i32.PageRouteInfo<void> {
  const FAQsRoute() : super(FAQsRoute.name, path: '/f-aqs-page');

  static const String name = 'FAQsRoute';
}

/// generated route for
/// [_i18.FAQsItemOTPPage]
class FAQsItemOTPRoute extends _i32.PageRouteInfo<void> {
  const FAQsItemOTPRoute()
      : super(FAQsItemOTPRoute.name, path: '/f-aqs-item-ot-pPage');

  static const String name = 'FAQsItemOTPRoute';
}

/// generated route for
/// [_i19.TermsPrivacyPage]
class TermsPrivacyRoute extends _i32.PageRouteInfo<void> {
  const TermsPrivacyRoute()
      : super(TermsPrivacyRoute.name, path: '/terms-privacy-page');

  static const String name = 'TermsPrivacyRoute';
}

/// generated route for
/// [_i20.LoginEnterPhonePage]
class LoginEnterPhoneRoute
    extends _i32.PageRouteInfo<LoginEnterPhoneRouteArgs> {
  LoginEnterPhoneRoute(
      {required _i37.Completer<_i34.AppUser> completer,
      required String phoneNumber,
      required String photoURL,
      required String uid,
      required String email,
      _i33.Key? key})
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

  final _i37.Completer<_i34.AppUser> completer;

  final String phoneNumber;

  final String photoURL;

  final String uid;

  final String email;

  final _i33.Key? key;

  @override
  String toString() {
    return 'LoginEnterPhoneRouteArgs{completer: $completer, phoneNumber: $phoneNumber, photoURL: $photoURL, uid: $uid, email: $email, key: $key}';
  }
}

/// generated route for
/// [_i21.NewRequestPage]
class NewRequestRoute extends _i32.PageRouteInfo<NewRequestRouteArgs> {
  NewRequestRoute({_i33.Key? key, required String recordId})
      : super(NewRequestRoute.name,
            path: '/new-request-page',
            args: NewRequestRouteArgs(key: key, recordId: recordId));

  static const String name = 'NewRequestRoute';
}

class NewRequestRouteArgs {
  const NewRequestRouteArgs({this.key, required this.recordId});

  final _i33.Key? key;

  final String recordId;

  @override
  String toString() {
    return 'NewRequestRouteArgs{key: $key, recordId: $recordId}';
  }
}

/// generated route for
/// [_i22.P12DetailPage]
class P12DetailRoute extends _i32.PageRouteInfo<P12DetailRouteArgs> {
  P12DetailRoute({_i33.Key? key, required String recordId})
      : super(P12DetailRoute.name,
            path: '/p12-detail-page',
            args: P12DetailRouteArgs(key: key, recordId: recordId));

  static const String name = 'P12DetailRoute';
}

class P12DetailRouteArgs {
  const P12DetailRouteArgs({this.key, required this.recordId});

  final _i33.Key? key;

  final String recordId;

  @override
  String toString() {
    return 'P12DetailRouteArgs{key: $key, recordId: $recordId}';
  }
}

/// generated route for
/// [_i23.P10QuotePricePage]
class P10QuotePriceRoute extends _i32.PageRouteInfo<P10QuotePriceRouteArgs> {
  P10QuotePriceRoute(
      {_i33.Key? key,
      required _i36.PendingRepairRequest record,
      required _i35.IList<_i8.PendingServiceModel> pendingService,
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

  final _i33.Key? key;

  final _i36.PendingRepairRequest record;

  final _i35.IList<_i8.PendingServiceModel> pendingService;

  final int pendingAmount;

  @override
  String toString() {
    return 'P10QuotePriceRouteArgs{key: $key, record: $record, pendingService: $pendingService, pendingAmount: $pendingAmount}';
  }
}

/// generated route for
/// [_i24.UpdateServicePage]
class UpdateServiceRoute extends _i32.PageRouteInfo<UpdateServiceRouteArgs> {
  UpdateServiceRoute(
      {required String providerID,
      required String category,
      required String sName,
      _i33.Key? key})
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

  final _i33.Key? key;

  @override
  String toString() {
    return 'UpdateServiceRouteArgs{providerID: $providerID, category: $category, sName: $sName, key: $key}';
  }
}

/// generated route for
/// [_i25.AddProductPage]
class AddProductRoute extends _i32.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute(
      {required String providerID,
      required String cate,
      required String sName,
      required String pName,
      required int type,
      _i33.Key? key})
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

  final _i33.Key? key;

  @override
  String toString() {
    return 'AddProductRouteArgs{providerID: $providerID, cate: $cate, sName: $sName, pName: $pName, type: $type, key: $key}';
  }
}

/// generated route for
/// [_i26.PermissionPage]
class PermissionRoute extends _i32.PageRouteInfo<void> {
  const PermissionRoute()
      : super(PermissionRoute.name, path: '/permission-page');

  static const String name = 'PermissionRoute';
}

/// generated route for
/// [_i27.MapRoutePage]
class MapRouteRoute extends _i32.PageRouteInfo<MapRouteRouteArgs> {
  MapRouteRoute(
      {_i33.Key? key,
      required String recordId,
      required String consumerId,
      required _i34.AppUser consumer,
      required double distance,
      required _i35.IList<_i8.PendingServiceModel> pendingService,
      required int pendingAmount})
      : super(MapRouteRoute.name,
            path: '/map-route-page',
            args: MapRouteRouteArgs(
                key: key,
                recordId: recordId,
                consumerId: consumerId,
                consumer: consumer,
                distance: distance,
                pendingService: pendingService,
                pendingAmount: pendingAmount));

  static const String name = 'MapRouteRoute';
}

class MapRouteRouteArgs {
  const MapRouteRouteArgs(
      {this.key,
      required this.recordId,
      required this.consumerId,
      required this.consumer,
      required this.distance,
      required this.pendingService,
      required this.pendingAmount});

  final _i33.Key? key;

  final String recordId;

  final String consumerId;

  final _i34.AppUser consumer;

  final double distance;

  final _i35.IList<_i8.PendingServiceModel> pendingService;

  final int pendingAmount;

  @override
  String toString() {
    return 'MapRouteRouteArgs{key: $key, recordId: $recordId, consumerId: $consumerId, consumer: $consumer, distance: $distance, pendingService: $pendingService, pendingAmount: $pendingAmount}';
  }
}

/// generated route for
/// [_i28.ChangeLanguagePage]
class ChangeLanguageRoute extends _i32.PageRouteInfo<void> {
  const ChangeLanguageRoute()
      : super(ChangeLanguageRoute.name, path: '/change-language-page');

  static const String name = 'ChangeLanguageRoute';
}

/// generated route for
/// [_i29.CommonServicePage]
class CommonServiceRoute extends _i32.PageRouteInfo<CommonServiceRouteArgs> {
  CommonServiceRoute(
      {required String providerID, required int sortType, _i33.Key? key})
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

  final _i33.Key? key;

  @override
  String toString() {
    return 'CommonServiceRouteArgs{providerID: $providerID, sortType: $sortType, key: $key}';
  }
}

/// generated route for
/// [_i30.CommonProductPage]
class CommonProductRoute extends _i32.PageRouteInfo<CommonProductRouteArgs> {
  CommonProductRoute(
      {required List<_i34.RepairProduct> products,
      required _i37.Completer<List<_i35.Tuple2<_i34.RepairProduct, _i38.File>>>
          complete,
      _i33.Key? key})
      : super(CommonProductRoute.name,
            path: '/common-product-page',
            args: CommonProductRouteArgs(
                products: products, complete: complete, key: key));

  static const String name = 'CommonProductRoute';
}

class CommonProductRouteArgs {
  const CommonProductRouteArgs(
      {required this.products, required this.complete, this.key});

  final List<_i34.RepairProduct> products;

  final _i37.Completer<List<_i35.Tuple2<_i34.RepairProduct, _i38.File>>>
      complete;

  final _i33.Key? key;

  @override
  String toString() {
    return 'CommonProductRouteArgs{products: $products, complete: $complete, key: $key}';
  }
}

/// generated route for
/// [_i31.HomePage]
class HomeRoute extends _i32.PageRouteInfo<HomeRouteArgs> {
  HomeRoute(
      {required _i34.AppUser user,
      _i33.Key? key,
      List<_i32.PageRouteInfo>? children})
      : super(HomeRoute.name,
            path: '/home-page',
            args: HomeRouteArgs(user: user, key: key),
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({required this.user, this.key});

  final _i34.AppUser user;

  final _i33.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i31.HomePrimaryPage]
class HomePrimaryRoute extends _i32.PageRouteInfo<HomePrimaryRouteArgs> {
  HomePrimaryRoute({required _i34.AppUser user, _i33.Key? key})
      : super(HomePrimaryRoute.name,
            path: 'home-primary-page',
            args: HomePrimaryRouteArgs(user: user, key: key));

  static const String name = 'HomePrimaryRoute';
}

class HomePrimaryRouteArgs {
  const HomePrimaryRouteArgs({required this.user, this.key});

  final _i34.AppUser user;

  final _i33.Key? key;

  @override
  String toString() {
    return 'HomePrimaryRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [_i31.HistoryProviderPage]
class HistoryProviderRoute extends _i32.PageRouteInfo<void> {
  const HistoryProviderRoute()
      : super(HistoryProviderRoute.name, path: 'history-provider-page');

  static const String name = 'HistoryProviderRoute';
}

/// generated route for
/// [_i31.NotificationProviderPage]
class NotificationProviderRoute extends _i32.PageRouteInfo<void> {
  const NotificationProviderRoute()
      : super(NotificationProviderRoute.name,
            path: 'notification-provider-page');

  static const String name = 'NotificationProviderRoute';
}

/// generated route for
/// [_i31.AccountPage]
class AccountRoute extends _i32.PageRouteInfo<AccountRouteArgs> {
  AccountRoute({required _i34.AppUser user, _i33.Key? key})
      : super(AccountRoute.name,
            path: 'account-page', args: AccountRouteArgs(user: user, key: key));

  static const String name = 'AccountRoute';
}

class AccountRouteArgs {
  const AccountRouteArgs({required this.user, this.key});

  final _i34.AppUser user;

  final _i33.Key? key;

  @override
  String toString() {
    return 'AccountRouteArgs{user: $user, key: $key}';
  }
}
