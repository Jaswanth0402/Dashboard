import 'package:dashboard_task/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/presentation/widgets/components/insert_profile_widget.dart';
import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatelessWidget {
  final VoidCallback onpressed;
  const DrawerWidget({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkBlack,
      child: Column(
        children: [
           DrawerHeader(
              child: Column(
            children: [
              // CircleAvatar(
              //   radius: 48,
              //   backgroundImage: AssetImage("image/profile.png"),

              // ),

              BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                if(state is DashboardSuccessProfileState){
                  return
                    ImageProfile(image:state.image);
                }
                else{
                  return  const ImageProfile();
                }
                  
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Jaswanth Kumar",
                style: TextStyle(
                    color: white, fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          )),
          const ListTileWidget(
            leadingicons: Icons.home_max_outlined,
            title: "Home",
          ),
          const ListTileWidget(
            leadingicons: Icons.dashboard_customize_outlined,
            title: "Dashboard",
          ),
          const ListTileWidget(
            leadingicons: Icons.payment_outlined,
            title: "Payment",
          ),
          const ListTileWidget(
            leadingicons: Icons.money_off_csred_outlined,
            title: "Transaction",
          ),
          const ListTileWidget(
            leadingicons: Icons.message_outlined,
            title: "Message",
          ),
          const ListTileWidget(
            leadingicons: Icons.settings_accessibility_outlined,
            title: "Settings",
          ),
          const ListTileWidget(
            leadingicons: Icons.report_outlined,
            title: "Report",
          ),
          const SizedBox(
            height: 30,
          ),
          ListTileWidget(
            onpressed: onpressed,
            leadingicons: Icons.logout_outlined,
            title: "Logout",
          ),
        ],
      ),
    );
  }
}