import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/bloc/login/bloc/login_bloc.dart';
import 'package:dashboard_task/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../widgets/Login/login_widget.dart';
import '../../widgets/components/toast_widget.dart';
import '../../widgets/loadingwidget/loading_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<LoginBloc,LoginState>(
      listenWhen: (previous, current) => current is LoginActionState,
      buildWhen: (previous, current) => current is! LoginActionState,
      listener: (context, state) {
        if (state is LoginSuccessState) {
         
          context.router.pushNamed(Strings.dashboardroute);
        }
        if(state is LoginSignupNavigateState){
           context.router.pushNamed(Strings.signuproute);
        }
        if(state is LoginErrorState){
         FToast toast =FToast();
         toast.init(context);
         toast.showToast(
          child: showToast(state.message),
         toastDuration: const Duration(seconds: 2),
         positionedToastBuilder: (context, child) {
          return Positioned(
            top: 16.0,
            left: MediaQuery.of(context).size.width*0.42,
            child: child,
          );
        });
        }
       
      },
      builder: (context, state) {
        switch (state) {
          case LoginOnLoadState():
            return const LoginWidget();
          case LoginSuccessState():
          case LoginActionState():
          case LoginOnLoadLogoutState():
             return const LoadingWidget();
          }
         return const SizedBox(height: 8,);
      },
    );
  }

}
 