import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/routes/auth_route_guard.dart';
import  'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter{

  @override
  List<AutoRoute> get routes =>[
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      page:  LoginPage.page,
      initial: true,
      keepHistory: false,
      ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      path: '/signup',
      page: SignupPage.page,
      keepHistory: false,
      ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      path: '/dashboard',
      page: DashBoardPage.page,
      guards: [AuthGuard()],
      keepHistory: false,
      )
  ];
}