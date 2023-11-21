import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:dashboard_task/data/models/sidebar_items.dart';
import 'package:dashboard_task/presentation/widgets/Home/home.dart';
import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/drawer-widget.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/responsive_dashboard/dashboard.dart';
import 'package:dashboard_task/presentation/widgets/loadingwidget/loading_widget.dart';
import 'package:dashboard_task/presentation/widgets/settings/settings.dart';
import 'package:dashboard_task/presentation/widgets/settings/widget/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';
import '../../../../data/models/setting.dart';

class DesktopDashboard extends StatefulWidget {
  const DesktopDashboard({Key? key}) : super(key: key);

  @override
  State<DesktopDashboard> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopDashboard> {
  SidebarItem currentitem =SidebarItems.home;
  SettingItem currentitems =SettingItems.accountsettings;
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<DashboardBloc, DashboardState>(
      listenWhen: (previous, current) => current is DashboardActionState,
      buildWhen: (previous, current) => current is! DashboardActionState,
      listener: (context, state) {
        if(state is DashboardSuccessState){
          context.router.pushNamed('/');
        }
      },
      builder: (context, state) {
        if (state is DashboardInitialState) {
          return Scaffold(
            backgroundColor: white,
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // open drawer
                Expanded(
                    flex: 1,
                    child: DrawerWidget(
                      currentitem:currentitem,
                      onSelectedItems:(item){
                        setState(() {
                          currentitem =item;
                        });
                      },
                      
                    )),

                // first half of page
                  Expanded(
                  flex: 6,
                  child: getScreen(),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox(
            height: 5,
          );
        }
      },
    );
    
  }
  Widget getScreen(){
    switch (currentitem) {
      case SidebarItems.home:
       return  const HomeWidget();
      case SidebarItems.dashboard:
        return const DashboardSide(screen: "desktop",);
      case SidebarItems.settings:
        return SettingWidget(currentitems: currentitems,onSelectedmenu:(items){
                        setState(() {
                          currentitems =items;
                        });
                      },);
      case SidebarItems.report:
        return const ReportWidget();
      default:
      return const LoadingWidget();
    }
  }
  
}
