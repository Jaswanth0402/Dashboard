import 'package:dashboard_task/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:dashboard_task/core/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'responsive_dashboard/desktop_dashboard.dart';
import 'responsive_dashboard/mobile_dashboard.dart';
import 'responsive_dashboard/tablet_dashboard.dart';

class DashBoardWidget extends StatefulWidget {
  const DashBoardWidget({super.key});

  @override
  State<DashBoardWidget> createState() => _DashBoardWidgetState();
}

class _DashBoardWidgetState extends State<DashBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => DashboardBloc(),
      child: const ResponsiveLayout(
        mobileScaffold: MobileDashboard(),
        desktopScaffold: DesktopDashboard(),
        tabletScaffold: TabletDashboard(),
      ),
    );
  }
}
