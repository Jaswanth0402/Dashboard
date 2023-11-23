import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/routes/auth_route_guard.dart';
import '../core/constants/string.dart';
import  'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter{

  @override
  List<AutoRoute> get routes =>[
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      page:  HomePage.page,
      initial: true,
      ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      path: Strings.loginroute,
      page:  LoginPage.page,
      ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      path: Strings.signuproute,
      page: SignupPage.page,
      keepHistory: false,
      ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      path: Strings.dashboardroute,
      page: DashBoardPage.page,
      guards: [AuthGuard()],
      keepHistory: false,
      
      )
     
  ];
}