import 'package:dashboard_task/core/constants/string.dart';
import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/presentation/widgets/components/alertbox.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(10),
      child:  Column(children: [
        Container(
       padding: const EdgeInsets.all(2),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(Strings.home,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: darkBlack),),
            ElevatedButton.icon(
              onPressed: (){
                showDialog(context: context, builder: LogoutAlert);
              }, 
              icon: const Icon(Icons.logout_outlined,color: white,), 
              label: const Text(Strings.logout),
              style: ElevatedButton.styleFrom(backgroundColor: darkBlack),
              ),
            
          ],
        )
        )
      ]),
    );
  }
}