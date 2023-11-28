import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/bloc/signup/bloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/constants/string.dart';
import '../../widgets/components/toast_widget.dart';
import '../../widgets/signup/signup_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SignupBloc,SignupState>(
      listenWhen: (previous, current) => current is SignupActionState,
      buildWhen: (previous, current) => current is! SignupActionState,
      listener: (context, state) {
       
        if(state is SignupSuccessState){
           FToast toast =FToast();
         toast.init(context);
         toast.showToast(
          child: showToast(state.message,'Success'),
         toastDuration: const Duration(seconds: 2),
         positionedToastBuilder: (context, child) {
          return Positioned(
            top: 16.0,
            left: MediaQuery.of(context).size.width*0.42,
            child: child,
          );
        });
        context.router.pushNamed(Strings.loginroute);
       }
       if(state is SignupErrorState){
        FToast toast =FToast();
         toast.init(context);
         toast.showToast(
          child: showToast(state.message,"Error"),
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
          case SignupOnLoadState():
            return  SignupWidget(image: state.image,);
          case SignupInitial():
          case SignupSuccessState():
            return const SizedBox(height: 10,);
          case SignupActionState():
          return const SizedBox(height: 10,);
          case InsertProfileSuccessState():
             return const SizedBox(height: 10,);
          }
        
      
      },
    );
  }
}
