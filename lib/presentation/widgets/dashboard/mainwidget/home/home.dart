import 'package:dashboard_task/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:dashboard_task/core/constants/string.dart';
import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/presentation/widgets/components/alertbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext contexta) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Container(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  Strings.home,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: darkBlack),
                ),
                ElevatedButton.icon(
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
                    color: white,
                  ),
                  label: const Text(Strings.logout),
                  style: ElevatedButton.styleFrom(backgroundColor: darkBlack),
                ),
              ],
            ))
      ]),
    );
  }
}
