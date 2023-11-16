import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/data/models/card_modal.dart';
import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final CardDataModel details;
  

  const MyBox({super.key, required this.details});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: details.backcolor,
          
        ),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: details.backcolor.withOpacity(1),
              width: 40,
              height:40,
              
              child: Icon(details.icon,color:darkBlack,),
            ),
             Text(details.title,style: const TextStyle(color:darkBlack,fontSize: 10,fontWeight: FontWeight.bold),),

             Text(details.money,style: const TextStyle(color:darkBlack,fontWeight: FontWeight.bold,fontSize: 20)),
          ],
        ),
      ),
    );
  }
}