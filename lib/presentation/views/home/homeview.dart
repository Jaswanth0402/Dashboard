import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/bloc/home/bloc/home_bloc.dart';
import 'package:dashboard_task/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/home/home_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
       if(state is HomeInitialState){
         
         
          context.router.pushNamed(Strings.loginroute);
        
        }
      },
      child: const HomeWidget(),
    );
  }
}
