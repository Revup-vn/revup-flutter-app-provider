import 'package:auto_route/auto_route.dart';

import '../analytics/view/analytics_page.dart';
import '../change_language/view/change_language_page.dart';
import '../common_product/view/common_product_page.dart';
import '../common_service/view/common_service_page.dart';
import '../guide-support/view/about_us_page.u.dart';
import '../guide-support/view/faqs_page.u.dart';
import '../guide-support/view/terms_privacy_page.u.dart';
import '../guide-support/widgets/faqs_item_otp.u.dart';
import '../home/home.dart';
import '../home/modules/history/history_provider_detail/view/history_detail_page.u.dart';
import '../login/login_enter_phone/view/login_enter_phone_number_page.u.dart';
import '../login/view/login_page.u.dart';
import '../map_route/view/map_route_page.dart';
import '../my_review/my_review.dart';
import '../new_request/view/new_request_page.dart';
import '../otp/view/otp_page.u.dart';
import '../permission_page/permission_page.u.dart';
import '../repair_request/modules/choose_product/view/choose_product_page.dart';
import '../repair_request/modules/p10_quote_price/view/p10_quote_price_page.dart';
import '../repair_request/modules/p12_detail_order/view/p12_detail_page.u.dart';
import '../repair_request/modules/p14_repair_completed/view/p14_repair_completed_page.u.dart';
import '../repair_request/modules/p16_finished_order_detail/view/p16_finished_order_detail_page.u.dart';
import '../repair_request/modules/p3_request_detail/view/p3_request_detail.u.dart';
import '../repair_request/modules/p4_info_request/view/info_request_page.u.dart';
import '../repair_request/modules/p4_start_repair/view/start_repair_page.u.dart';
import '../repair_request/modules/service_suggestion/view/service_suggestion_page.dart';
import '../repair_request/request.dart';
import '../repair_service/add-product/view/add_product_page.u.dart';
import '../repair_service/repair_service.dart';
import '../repair_service/update_service/view/view.dart';
import '../signup/view/signup_page.u.dart';
import '../splash/splash.dart';
import '../vendor_authentication/vender_authentication.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AdaptiveRoute<void>(page: SplashPage, initial: true),
    AdaptiveRoute<void>(page: AnalyticsPage),
    AdaptiveRoute<void>(page: LoginPage),
    AdaptiveRoute<void>(page: StartRepairPage),
    AdaptiveRoute<void>(page: P3RequestDetailPage),
    AdaptiveRoute<void>(page: InfoRequestPage),
    AdaptiveRoute<void>(page: P14RepairCompletePage),
    AdaptiveRoute<void>(page: P13SelectOptionCompletePage),
    AdaptiveRoute<void>(page: P16FinishedOrderDetailPage),
    AdaptiveRoute<void>(page: AddServicePage),
    AdaptiveRoute<void>(page: MyReviewPage),
    AdaptiveRoute<void>(page: VendorAuthenticationPage),
    AdaptiveRoute<void>(page: ListServicePage),
    AdaptiveRoute<void>(page: DetailServicePage),
    AdaptiveRoute<void>(page: HistoryProviderDetailPage),
    AdaptiveRoute<void>(page: SignupPage),
    AdaptiveRoute<void>(page: OTPPage),
    AdaptiveRoute<void>(page: AboutUsPage),
    AdaptiveRoute<void>(page: FAQsPage),
    AdaptiveRoute<void>(page: FAQsItemOTPPage),
    AdaptiveRoute<void>(page: TermsPrivacyPage),
    AdaptiveRoute<void>(page: LoginEnterPhonePage),
    AdaptiveRoute<void>(page: NewRequestPage),
    AdaptiveRoute<void>(page: P12DetailPage),
    AdaptiveRoute<void>(page: P10QuotePricePage),
    AdaptiveRoute<void>(page: UpdateServicePage),
    AdaptiveRoute<void>(page: AddProductPage),
    AdaptiveRoute<void>(page: PermissionPage),
    AdaptiveRoute<void>(page: MapRoutePage),
    AdaptiveRoute<void>(page: ChangeLanguagePage),
    AdaptiveRoute<void>(page: CommonServicePage),
    AdaptiveRoute<void>(page: CommonProductPage),
    AdaptiveRoute<void>(page: ServiceSuggestionPage),
    AdaptiveRoute<void>(page: ChooseProductPage),
    AdaptiveRoute<void>(
      page: HomePage,
      children: [
        AdaptiveRoute<void>(page: HomePrimaryPage),
        AdaptiveRoute<void>(page: HistoryProviderPage),
        AdaptiveRoute<void>(page: NotificationProviderPage),
        AdaptiveRoute<void>(page: AccountPage),
      ],
    ),
  ],
)
class $AppRouter {}
