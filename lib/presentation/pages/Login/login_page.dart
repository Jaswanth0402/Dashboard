import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/bloc/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views/Login/login_view.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
   static const keyPrefix = 'LoginPage';
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: const LoginView(),
    );
  }
}
