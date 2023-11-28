import 'package:dashboard_task/bloc/settings/bloc/setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/string.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../data/models/setting.dart';
import 'component/settings_drawer.dart';
import 'widget/accountsettings/account_setting.dart';
import 'widget/profile/profile.dart';


class SettingItems {
  static const profile = SettingItem(Strings.profile);
  static const accountsettings = SettingItem(Strings.accountsettings);
  static const teammember = SettingItem(Strings.teammember);
  static const socialprofile = SettingItem(Strings.socialprofile);
  static const notification = SettingItem(Strings.notification);

  static const all = <SettingItem>[
    profile,
    accountsettings,
    
  ];
}

class SettingWidget extends StatelessWidget {
final String screen;
  const SettingWidget(
      {super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        if(state is SettingInitialState){
        return SafeArea(
          child: Container(
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('image/back2.jpeg',),fit: BoxFit.cover)),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(color: white),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.settings,
                            color: lightBlueAccent,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        Strings.settings,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child:
                    screen =='mobile'?
                    Column(children: [
                      Expanded(
                          flex: 1,
                          child: SettingsDrawer(
                            screen:screen,
                            currentitems: state.currentitem,
            onSelectedmenu: (items) {
               BlocProvider.of<SettingBloc>(context).add(SettingDrawerSelectEvent(item: items));
            },
                          )),
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                          flex: 5,
                          child: SingleChildScrollView(child: getScreen(state.currentitem)))
                    ]):
                     Row(children: [
                      Expanded(
                          flex: 1,
                          child: SettingsDrawer(
                            screen: screen,
                            currentitems: state.currentitem,
            onSelectedmenu: (items) {
               BlocProvider.of<SettingBloc>(context).add(SettingDrawerSelectEvent(item: items));
            },
                          )),
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                          flex: 5,
                          child: SingleChildScrollView(child: getScreen(state.currentitem)))
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      else {
          return const SizedBox(
            height: 5,
          );
        }
      }
    );
  }

  Widget getScreen(currentitems) {
    switch (currentitems) {
      case SettingItems.accountsettings:
        return  AccountSetting(screen:screen);
      case SettingItems.profile:
        return const ProfileWidget();
      default:
        return const SizedBox(
          child: SizedBox(
            height: 20,
          ),
        );
    }
  }
}
