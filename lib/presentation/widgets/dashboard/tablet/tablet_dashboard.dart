import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/presentation/widgets/components/search_field.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/mobile/mobiledashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/dashboard/bloc/dashboard_bloc.dart';
import '../../../../bloc/settings/bloc/setting_bloc.dart';
import '../../../../core/constants/string.dart';
import '../../../../core/utils/colors.dart';
import '../../../../data/models/sidebar_items.dart';
import '../../loadingwidget/loading_widget.dart';
import '../component/drawer_widget.dart';
import '../mainwidget/accounts/accounts.dart';
import '../mainwidget/expense/spending.dart';
import '../mainwidget/report/report.dart';
import '../mainwidget/settings/settings.dart';

class TabletDashboard extends StatefulWidget {
  const TabletDashboard({super.key});

  @override
  State<TabletDashboard> createState() => _TabletDashboardState();
}

class _TabletDashboardState extends State<TabletDashboard> {
  SidebarItem currentSelecteditem =SidebarItems.accounts;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listenWhen: (previous, current) => current is DashboardActionState,
      buildWhen: (previous, current) => current is! DashboardActionState,
      listener: (context, state) {
       if (state is DashboardSuccessState) {
          context.router.pushNamed('/');
        }
      },
      builder: (context, state) {
        if(state is DashboardInitialState){
        return SafeArea(
          child: Scaffold(
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
              title: const Text(
                Strings.dashboard,
                style: TextStyle(color: darkBlack),
              ),
              actions: const [
                Padding(padding: EdgeInsets.all(5), child: SearchFormField()),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.notifications,
                  color: darkBlack,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
              backgroundColor: white,
            ),
            backgroundColor: white,
            drawer: DrawerWidget(
             currentitem: state.currentitem!,
                          onSelectedItems: (item) {
                            BlocProvider.of<DashboardBloc>(context)
                                .add(DashboardSidebarSelectEvent(item: item));
                                Navigator.pop(context);
                                }
                              
            ),
            body: getScreen(state.currentitem),
          ),
        );
        }
        else{
          return
          const SizedBox(height: 7,);
        }
      },
    );
  }
   Widget getScreen(currentitem) {
    switch (currentitem) {
      case SidebarItems.accounts:
        return const AccountWidget(
          screen: "Tablet",
        );
      case SidebarItems.dashboard:
        return const MobileDashboardWidget(
        );
      case SidebarItems.settings:
        return BlocProvider(
          create: (context) => SettingBloc(),
          child: const SettingWidget(
            screen: 'Tablet',
          ),
        );
      case SidebarItems.report:
        return const ReportWidget();
      case SidebarItems.myspendings:
        return const Myspendings(
          screen: "Tablet",
        );
      default:
        return const LoadingWidget();
    }
  }
}
