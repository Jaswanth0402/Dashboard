import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/drawer-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/dashboard/bloc/dashboard_bloc.dart';
import '../../../../core/utils/colors.dart';

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({super.key});

  @override
  State<MobileDashboard> createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      backgroundColor:white,
      drawer: DrawerWidget(onpressed: () {
                  BlocProvider.of<DashboardBloc>(context)
                      .add(DashboardLogoutEvent());
                },),
    );
  }
}