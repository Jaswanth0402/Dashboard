import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views/dashboard/dashboard_view.dart';

@RoutePage()
class DashBoardPage extends StatelessWidget {
  static const keyPrefix = 'DashBoardPage';
  const DashBoardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => DashboardBloc(),
      child: DashBoardView(),
    );
  }
}
