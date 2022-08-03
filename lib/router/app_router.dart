import 'package:auto_route/auto_route.dart';

import '../login/view/login_page.dart';
import '../splash/splash.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AdaptiveRoute<void>(
      page: SplashPage,
      initial: true,
    ),
    AdaptiveRoute<void>(
      page: LoginPage,
    ),
  ],
)
class $AppRouter {}
