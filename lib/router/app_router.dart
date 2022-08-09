import 'package:auto_route/auto_route.dart';

import '../home/home.dart';
import '../login/view/login_page.dart';
import '../my_review/my_review.dart';
import '../repair_service/detail_service/view/detail_service_view.u.dart';
import '../repair_service/repair_service.dart';
import '../request/modules/modules.dart';
import '../splash/splash.dart';
import '../vendor_authentication/vender_authentication.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AdaptiveRoute<void>(
      page: SplashPage,
      initial: true,
    ),
    AdaptiveRoute<void>(page: LoginPage),
    AdaptiveRoute<void>(page: DetailServiceRequestPage),
    AdaptiveRoute<void>(page: InfoRequestPage),
    AdaptiveRoute<void>(page: RepairCompletePage),
    AdaptiveRoute<void>(page: SelectOptionCompletePage),
    AdaptiveRoute<void>(page: AddServicePage),
    AdaptiveRoute<void>(page: DetailServiceView),
    AdaptiveRoute<void>(page: ListServiceView),
    AdaptiveRoute<void>(page: MyReviewPage),
    AdaptiveRoute<void>(page: VendorAuthenticationPage),
    AdaptiveRoute<void>(page: ListServicePage),
    AdaptiveRoute<void>(page: DetailServicePage),
    AdaptiveRoute<void>(page: HistoryProviderDetailPage),
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
