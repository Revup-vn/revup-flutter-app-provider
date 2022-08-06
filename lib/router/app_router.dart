import 'package:auto_route/auto_route.dart';

import '../account/view/account_page.u.dart';
import '../history/history_provider/view/history_provider_page.u.dart';
import '../history/history_provider_detail/view/history_detail_provider_page.u.dart';
import '../home/view/home_page.u.dart';
import '../home/widgets/home_body_page.u.dart';
import '../login/view/login_page.dart';
import '../my_review/view/my_review_page.u.dart';
import '../notification_provider/view/notification_provider_page.u.dart';
import '../request/detail_service_request/view/detail_service_request_page.u.dart';
import '../request/info_request/view/info_request_page.u.dart';
import '../request/repair_completed/view/repair_completed_page.u.dart';
import '../request/select_option_complete/view/select_option_complete_page.u.dart';
import '../service/add-service/view/add_service_page.u.dart';
import '../service/detail_service/view/detail_service_page.u.dart';
import '../service/list_service/view/list_service_page.u.dart';
import '../splash/splash.dart';
import '../vendor_authentication/view/vendor_authentication_page.u.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AdaptiveRoute<void>(page: SplashPage),
    AdaptiveRoute<void>(page: LoginPage),
    AdaptiveRoute<void>(page: DetailServiceRequestPage),
    AdaptiveRoute<void>(page: InfoRequestPage),
    AdaptiveRoute<void>(page: RepairCompeletePage),
    AdaptiveRoute<void>(page: SelectOptionCompletePage),
    AdaptiveRoute<void>(page: AddServicePage),
    AdaptiveRoute<void>(page: MyReviewPage),
    AdaptiveRoute<void>(page: VendorAuthenticationPage),
    AdaptiveRoute<void>(page: ListServicePage),
    AdaptiveRoute<void>(page: DetailServicePage),
    AdaptiveRoute<void>(page: HistoryProviderDetailPage),
    AdaptiveRoute<void>(
      page: HomePage,
      initial: true,
      children: [
        AdaptiveRoute<void>(page: HomeBodyPage),
        AdaptiveRoute<void>(page: HistoryProviderPage),
        AdaptiveRoute<void>(page: NotificationProviderPage),
        AdaptiveRoute<void>(page: AccountPage),
      ],
    ),
  ],
)
class $AppRouter {}
