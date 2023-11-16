import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/drawer-widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class TabletDashboard extends StatefulWidget {
  const TabletDashboard({super.key});

  @override
  State<TabletDashboard> createState() => _TabletDashboardState();
}

class _TabletDashboardState extends State<TabletDashboard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(),
    backgroundColor:white,
    drawer:  DrawerWidget(onpressed: (){},),
    );
  }
}