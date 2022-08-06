import 'package:auto_route/auto_route.dart';

import '../home/home.dart';
import '../home/modules/history/history_provider_detail/view/history_detail_provider_page.u.dart';
import '../login/view/login_page.dart';
import '../my_review/view/my_review_view.u.dart';
import '../request/modules/modules.dart';
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
    AdaptiveRoute<void>(page: RepairCompletePage),
    AdaptiveRoute<void>(page: SelectOptionCompletePage),
    AdaptiveRoute<void>(page: AddServicePage),
    AdaptiveRoute<void>(page: MyReviewView),
    AdaptiveRoute<void>(page: VendorAuthenticationPage),
    AdaptiveRoute<void>(page: ListServicePage),
    AdaptiveRoute<void>(page: DetailServicePage),
    AdaptiveRoute<void>(page: HistoryProviderDetailPage),
    AdaptiveRoute<void>(
      page: HomePage,
      initial: true,
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
