import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../data/models/setting.dart';
import '../settings.dart';

class SettingsDrawer extends StatelessWidget {
  final String screen ;
  final SettingItem currentitems;
  final ValueChanged <SettingItem> onSelectedmenu;
  const SettingsDrawer({super.key, required this.currentitems, required this.onSelectedmenu, required this.screen});

  @override
  Widget build(BuildContext context) {
    
    return
    screen =='mobile'?
     Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                                  color: white),
                          child: 
                           Column(
                            children: [
                              ...SettingItems.all.map(ListTileWidget).toList()
                            ],
                          ),
                        ),
                      ),
                      
                    ],
                   ):
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                                  color: white),
                          child: 
                           Column(
                            children: [
                              ...SettingItems.all.map(ListTileWidget).toList()
                            ],
                          ),
                        ),
                      ),
                      
                    ],
                   );
  }
   // ignore: non_constant_identifier_names
   Widget ListTileWidget(SettingItem item){
return  ListTile(
      
      selectedTileColor: lightBlueAccent,
      selected: currentitems ==item,
      tileColor: darkBlack,
      title: Text(item.title),
      onTap:()=>onSelectedmenu(item)
    );
}
}