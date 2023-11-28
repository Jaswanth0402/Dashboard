import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/routes/routes.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
   router.pushNamed('/login');
    var email =preferences.get('email');
    if (email != null) {
      resolver.next(true); 
    } else {
      router.push(const HomePage());
    }
  }
}