import 'package:dashboard_task/data/models/sidebar_items.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';


Widget ListTileWidget(SidebarItem item){
return  ListTile(
      leading: Icon(item.icons,color: lightgray,),
      title: Text(item.title,style: const TextStyle(color: white),),
      onTap:(){}
    );
}