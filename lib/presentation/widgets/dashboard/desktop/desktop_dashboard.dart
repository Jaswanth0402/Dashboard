import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:dashboard_task/bloc/settings/bloc/setting_bloc.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/mainwidget/accounts/accounts.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/mainwidget/dashboard/dashboard.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/mainwidget/expense/spending.dart';
import 'package:dashboard_task/presentation/widgets/loadingwidget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';
import '../../../../data/models/setting.dart';
import '../component/drawer_widget.dart';
import '../mainwidget/settings/settings.dart';
import '../mainwidget/report/report.dart';

class DesktopDashboard extends StatefulWidget {
  const DesktopDashboard({super.key});

  @override
  State<DesktopDashboard> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopDashboard> {
  SettingItem currentitems = SettingItems.accountsettings;
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
                      currentitem: state.currentitem!,
                      onSelectedItems: (item) {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(DashboardSidebarSelectEvent(item: item));
                      },
                    )),

                // first half of page
                Expanded(
                  flex: 6,
                  child: getScreen(state.currentitem),
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

  Widget getScreen(currentitem) {
    switch (currentitem) {
      case SidebarItems.accounts:
        return const AccountWidget(
          screen: "desktop",
        );
      case SidebarItems.dashboard:
        return const DashboardSide(
          screen: "desktop",
        );
      case SidebarItems.settings:
        return BlocProvider(
          create: (context) => SettingBloc(),
          child: const SettingWidget(
            screen: 'desktop',
          ),
        );
      case SidebarItems.report:
        return  BlocProvider(
          create: (context) => DashboardBloc(),
          child: const ReportWidget(),
        );
      case SidebarItems.myspendings:
        return const Myspendings(
          screen: "desktop",
        );
      default:
        return const LoadingWidget();
    }
  }
}
