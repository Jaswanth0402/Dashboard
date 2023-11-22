import 'package:dashboard_task/presentation/widgets/components/search_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class Header extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onpressed;
  const Header({super.key, this.icon,this.onpressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      color: white,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Hello Jaswanth",style:TextStyle(color:Color.fromARGB(255, 104, 103, 103),fontSize: 20,fontWeight: FontWeight.bold ) ,),
                  Text('Welcome back!')
                ],
              ),  
            ],
          ),

          Row(
            children: [
              const SearchFormField(),
              IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active_outlined)),
              IconButton(onPressed: onpressed, icon:   Icon(icon))
            ],
          )
        ],
      ),
    );
  }
}