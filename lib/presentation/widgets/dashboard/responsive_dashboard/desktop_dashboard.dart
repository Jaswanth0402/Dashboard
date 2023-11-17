import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/drawer-widget.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/responsive_dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';

class DesktopDashboard extends StatefulWidget {
  const DesktopDashboard({Key? key}) : super(key: key);

  @override
  State<DesktopDashboard> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopDashboard> {
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
        if(state is DashboardInitialState){
        return Scaffold(
          backgroundColor: white,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // open drawer
              Expanded(child: DrawerWidget(
                onpressed: () {
                  BlocProvider.of<DashboardBloc>(context)
                      .add(DashboardLogoutEvent());
                },
              )),

              // first half of page
              const Expanded(
                flex: 5,
                child: DashboardSide(),
              ),
            ],
          ),
        );
        }
        else{
          return const SizedBox(height: 5,);
        }
      },
    );
  }
}
