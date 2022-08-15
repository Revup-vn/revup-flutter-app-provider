import 'package:auto_route/auto_route.dart';

import '../home/home.dart';
import '../login/login_enter_phone/view/login_enter_phone_number_page.u.dart';
import '../login/view/login_page.u.dart';
import '../my_review/my_review.dart';
import '../otp/view/otp_page.u.dart';
import '../repair_service/repair_service.dart';
import '../repair_service/update_service/view/view.dart';
import '../request/modules/modules.dart';
import '../signup/view/signup_page.u.dart';
import '../splash/splash.dart';
import '../vendor_authentication/vender_authentication.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AdaptiveRoute<void>(page: SplashPage, initial: true),
    AdaptiveRoute<void>(page: LoginPage),
    AdaptiveRoute<void>(page: DetailServiceRequestPage, maintainState: false),
    AdaptiveRoute<void>(page: InfoRequestPage),
    AdaptiveRoute<void>(page: RepairCompletePage),
    AdaptiveRoute<void>(page: SelectOptionCompletePage),
    AdaptiveRoute<void>(page: AddServicePage),
    AdaptiveRoute<void>(page: MyReviewPage),
    AdaptiveRoute<void>(page: VendorAuthenticationPage),
    AdaptiveRoute<void>(page: ListServicePage, maintainState: false),
    AdaptiveRoute<void>(page: DetailServicePage, maintainState: false),
    AdaptiveRoute<void>(page: HistoryProviderDetailPage),
    AdaptiveRoute<void>(page: SignupPage),
    AdaptiveRoute<void>(page: OTPPage),
    AdaptiveRoute<void>(page: LoginEnterPhonePage),
    AdaptiveRoute<void>(page: UpdateServicePage),
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
