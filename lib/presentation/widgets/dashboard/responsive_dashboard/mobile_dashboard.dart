import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/drawer-widget.dart';
import 'package:flutter/material.dart';

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
      drawer: DrawerWidget(onpressed: (){},),
    );
  }
}