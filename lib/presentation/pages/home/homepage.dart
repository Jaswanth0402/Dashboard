import 'package:auto_route/annotations.dart';
import 'package:dashboard_task/bloc/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views/home/homeview.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  static const keyPrefix = 'HomePage';
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeView(),
    );
  }
}
