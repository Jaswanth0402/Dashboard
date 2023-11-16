import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/signup/bloc/signin_bloc.dart';
import '../../views/Signin/signup_view.dart';

@RoutePage()
class SignupPage extends StatelessWidget {
   static const keyPrefix = 'SignupPage';
  const SignupPage({
    Key? key,
  }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => SignupBloc(),
      child: const SignupView(),
    );
  }
}
