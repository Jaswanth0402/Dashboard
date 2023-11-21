import 'package:dashboard_task/presentation/widgets/settings/component/settings_drawer.dart';
import 'package:dashboard_task/presentation/widgets/settings/widget/account_setting.dart';
import 'package:dashboard_task/presentation/widgets/settings/widget/profile/profile.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/string.dart';
import '../../../core/utils/colors.dart';
import '../../../data/models/setting.dart';


class SettingItems{
  static const profile =SettingItem(Strings.profile);
  static const accountsettings =SettingItem( Strings.accountsettings);
  static const teammember =SettingItem(Strings.teammember);
  static const socialprofile =SettingItem( Strings.socialprofile);
  static const notification =SettingItem(Strings.notification);
  

  static const all =<SettingItem>[
   profile,
   accountsettings,
   teammember,
   socialprofile,
   notification
  ];
}


class SettingWidget extends StatelessWidget {
  final SettingItem currentitems;
  final ValueChanged <SettingItem> onSelectedmenu;
  const SettingWidget({super.key, required this.currentitems, required this.onSelectedmenu});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        color: darkGrey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
               decoration: const BoxDecoration(color: white),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                      
                    ),
                    child: const Icon(Icons.settings,color: lightBlueAccent,)),
                  const SizedBox(width: 15,),
                  const Text(Strings.settings,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:  Row(
                  children: [
                     Expanded(
                      flex: 1,
                      child: SettingsDrawer(currentitems: currentitems,onSelectedmenu: onSelectedmenu,)),
                     const SizedBox(width: 18,),
                      Expanded(
                      flex: 5,
                      child: SingleChildScrollView(
                        child: getScreen()
                      ))
                ]),
              ),
            ),
          ],
        ),
      ),
    );
     
  }
 Widget getScreen(){
    switch (currentitems) {
      case SettingItems.accountsettings:
       return  const AccountSetting();
      case SettingItems.profile:
       return const ProfileWidget();
      default:
      return Container(
        child: const SizedBox(height: 20,),
      );
    }
  }
}