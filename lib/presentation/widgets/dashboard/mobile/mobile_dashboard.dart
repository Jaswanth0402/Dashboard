import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/mobile/mobiledashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/settings/bloc/setting_bloc.dart';
import '../../../../core/utils/colors.dart';
import '../../../../data/models/sidebar_items.dart';
import '../../components/alertbox.dart';
import '../../components/search_field.dart';
import '../../loadingwidget/loading_widget.dart';
import '../component/drawer_widget.dart';
import '../mainwidget/accounts/accounts.dart';
import '../mainwidget/expense/spending.dart';
import '../mainwidget/report/report.dart';
import '../mainwidget/settings/settings.dart';

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({super.key});

  @override
  State<MobileDashboard> createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  SidebarItem currentSelecteditem = SidebarItems.accounts;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listenWhen: (previous, current) => current is DashboardActionState,
      buildWhen: (previous, current) => current is! DashboardActionState,
      listener: (context, state) {
        if (state is DashboardSuccessState) {
          context.router.pushNamed('/home');
        }
      },
      builder: (context, state) {
        if (state is DashboardInitialState) {
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
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  },
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Jaswanth",
                      style: TextStyle(
                          color: Color.fromARGB(255, 104, 103, 103),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Welcome back!',
                      style: TextStyle(
                          color: Color.fromARGB(255, 104, 103, 103),
                          fontSize: 15),
                    )
                  ],
                ),
                actions: [
                  const Padding(
                      padding: EdgeInsets.all(9), child: SearchFormField()),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_active_outlined,
                        color: darkGrey,
                      )),
                  state.currentitem == SidebarItems.dashboard
                      ? IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: ((contexta) => BlocProvider(
                                      create: (contextb) => DashboardBloc(),
                                      child: LogoutAlert(context),
                                    )));
                          },
                          icon: const Icon(
                            Icons.logout_outlined,
                            color: darkGrey,
                          ))
                      : const SizedBox(
                          width: 1,
                        ),
                  const SizedBox(
                    width: 5,
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
                },
              ),
              body: getScreen(state.currentitem),
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
          screen: 'mobile',
        );
      case SidebarItems.dashboard:
        return const MobileDashboardWidget();
      case SidebarItems.settings:
        return BlocProvider(
          create: (context) => SettingBloc(),
          child: const SettingWidget(
            screen: 'mobile',
          ),
        );
      case SidebarItems.report:
        return  BlocProvider(
          create: (context) => DashboardBloc(),
          child: const ReportWidget(),
        );
      case SidebarItems.myspendings:
        return const Myspendings(
          screen: "mobile",
        );
      default:
        return const LoadingWidget();
    }
  }
}
