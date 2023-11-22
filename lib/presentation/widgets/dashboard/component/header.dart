import 'package:dashboard_task/presentation/widgets/components/search_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      color: white,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Text("Dashboard",style:TextStyle(color:Color.fromARGB(255, 104, 103, 103),fontSize: 20 ) ,),
              SizedBox(width: 20,),
              SearchFormField()
              
            ],
          ),

          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active_outlined))
        ],
      ),
    );
  }
}