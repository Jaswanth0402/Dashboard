// ignore_for_file: file_names, non_constant_identifier_names

import 'package:dashboard_task/data/models/sidebar_items.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_task/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/presentation/widgets/components/insert_profile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/string.dart';

class SidebarItems {
  static const accounts = SidebarItem(Icons.home_max_outlined, Strings.accounts);
  static const dashboard =
      SidebarItem(Icons.dashboard_customize_outlined, Strings.dashboard);
  static const myspendings = SidebarItem(Icons.payment_outlined, Strings.myspendings);
  static const message = SidebarItem(Icons.message_outlined, Strings.message);
  static const transaction =
      SidebarItem(Icons.money_outlined, Strings.transaction);
  static const settings =
      SidebarItem(Icons.settings_accessibility_outlined, Strings.settings);
  static const report = SidebarItem(Icons.report_off_outlined, Strings.report);

  static const all = <SidebarItem>[
    dashboard,
    accounts,
    myspendings,
    transaction,
    message,
    settings,
    report,
  ];
}

class DrawerWidget extends StatelessWidget {
  final SidebarItem currentitem;
  final ValueChanged<SidebarItem> onSelectedItems;
  const DrawerWidget(
      {super.key, required this.currentitem, required this.onSelectedItems});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkBlack,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    if (state is DashboardSuccessProfileState) {
                      return ImageProfile(image: state.image);
                    } else {
                      return const ImageProfile();
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  Strings.profilename,
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            )),
            ...SidebarItems.all.map(ListTileWidget)
          ],
        ),
      ),
    );
  }

  Widget ListTileWidget(SidebarItem item) {
    return ListTile(
        selectedTileColor: darkGrey,
        selected: currentitem == item,
        leading: Icon(
          item.icons,
          color: lightgray,
        ),
        title: Text(
          item.title,
          style: const TextStyle(color: white),
        ),
        onTap: () => onSelectedItems(item));
  }
}
