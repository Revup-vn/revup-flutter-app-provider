import 'package:auto_route/auto_route.dart';

import '../home/home.dart';
import '../login/login_enter_phone/view/login_enter_phone_number_page.u.dart';
import '../login/view/login_page.u.dart';
import '../my_review/my_review.dart';
import '../new_request/view/new_request_page.dart';
import '../otp/view/otp_page.u.dart';
import '../permission_page/view/permission_page.u.dart';
import '../repair_request/modules/detail_request/p10_quote_price/view/p10_quote_price_page.dart';
import '../repair_request/modules/detail_request/p16_finished_order_detail/view/p16_finished_order_detail_page.u.dart';
import '../repair_request/modules/detail_request/p3_request_detail/view/p3_request_detail.u.dart';
import '../repair_request/modules/p14_repair_completed/view/p14_repair_completed_page.u.dart';
import '../repair_request/modules/p4_info_request/view/info_request_page.u.dart';
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
    AdaptiveRoute<void>(page: SplashPage),
    AdaptiveRoute<void>(page: LoginPage),
    AdaptiveRoute<void>(page: P3RequestDetailPage, maintainState: false),
    AdaptiveRoute<void>(page: InfoRequestPage),
    AdaptiveRoute<void>(page: P14RepairCompletePage),
    AdaptiveRoute<void>(page: P13SelectOptionCompletePage),
    AdaptiveRoute<void>(page: P16FinishedOrderDetailPage),
    AdaptiveRoute<void>(page: AddServicePage),
    AdaptiveRoute<void>(page: MyReviewPage),
    AdaptiveRoute<void>(page: VendorAuthenticationPage),
    AdaptiveRoute<void>(page: ListServicePage, maintainState: false),
    AdaptiveRoute<void>(page: DetailServicePage, maintainState: false),
    AdaptiveRoute<void>(page: HistoryProviderDetailPage),
    AdaptiveRoute<void>(page: SignupPage),
    AdaptiveRoute<void>(page: OTPPage),
    AdaptiveRoute<void>(page: LoginEnterPhonePage),
    AdaptiveRoute<void>(page: NewRequestPage),
    AdaptiveRoute<void>(page: P12DetailPage, initial: true),
    AdaptiveRoute<void>(page: P10QuotePricePage),
    AdaptiveRoute<void>(page: UpdateServicePage),
    AdaptiveRoute<void>(page: AddProductPage),
    AdaptiveRoute<void>(page: PermissionPage),
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
