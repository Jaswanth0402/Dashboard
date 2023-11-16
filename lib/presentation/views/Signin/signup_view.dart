import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/bloc/signup/bloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        context.router.pushNamed('/');
       }
        
      },
      builder: (context, state) {
         switch (state) {
          case SignupOnLoadState():
            return const SignupWidget();
          case SignupInitial():
          case SignupSuccessState():
            return const SizedBox(height: 10,);
          case SignupActionState():
          return const SizedBox(height: 10,);
          case SignupErrorState():
          return const SizedBox(height: 10,);
         
        }
        
      
      },
    );
  }
}
