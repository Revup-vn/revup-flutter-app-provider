import 'package:auto_route/auto_route.dart';

import '../login/view/login_page.dart';
import '../request/detail_service_request/view/detail_service_request_page.u.dart';
import '../request/info_request/view/info_request_page.u.dart';
import '../request/repair_completed/view/repair_completed_page.u.dart';
import '../request/select_option_complete/view/select_option_complete_page.u.dart';
import '../service/add-service/view/add_service_view.u.dart';
import '../splash/splash.dart';

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
    AdaptiveRoute<void>(page: RepairCompeletePage),
    AdaptiveRoute<void>(page: SelectOptionCompletePage),
    AdaptiveRoute<void>(page: AddService),
  ],
)
class $AppRouter {}
