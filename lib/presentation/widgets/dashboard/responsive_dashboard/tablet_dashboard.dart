import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/drawer-widget.dart';
import 'package:dashboard_task/presentation/widgets/components/search_field.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/dashboard_widget.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/responsive_dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/string.dart';
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
     appBar: AppBar(
      leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.menu,
            color: darkBlack,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
      title: const Text(Strings.dashboard,style: TextStyle(color: darkBlack),),
      actions:  const [

        Padding(
         padding: EdgeInsets.all(5),
          child: SearchFormField()),
        SizedBox(width: 10,),
        Icon(Icons.notifications,color: darkBlack,),
         SizedBox(width: 10,),
      ],
      backgroundColor: white,
     ),
    backgroundColor:white,
    drawer:  DrawerWidget(onpressed: (){},),
    body: const DashboardSide(screen: "tablet",),
    );
  }
}