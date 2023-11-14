import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class ListTileWidget extends StatelessWidget {
  final IconData leadingicons;
  final String title;
  final VoidCallback? onpressed;
  const ListTileWidget({super.key, required this.leadingicons, required this.title, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onpressed,
      child: ListTile(
        leading: Icon(leadingicons,color: lightgray,),
        title: Text(title,style: const TextStyle(color: white),),
      ),
    );
  }
}