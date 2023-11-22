import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/data/constant%20data/accountdata.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/component/header.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/mainwidget/accounts/carddetail.dart';
import 'package:flutter/material.dart';


class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext contexta) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

              const Header(),
                   const Padding(
                     padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                     child: Column(
                       children: [
                         Text("Total Balance",style: TextStyle(color: purple,fontSize: 15,fontWeight: FontWeight.bold),),
                         SizedBox(height: 5,),
                         Padding(
                           padding: EdgeInsets.only(left: 8),
                           child: Text("Rs.5,00,000",style: TextStyle(color: darkBlack,fontSize: 20,fontWeight: FontWeight.bold)),
                         ),
                       ],
                     ),
                   ),
           

                   Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: GridView.builder(
              itemCount: accountData.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 10, childAspectRatio: 2),
              itemBuilder: (context,index) {
                return  CardDetails(
                  details: accountData[index],
                );
              },
            ),
          ),
        
                  ]),
    );
  }
}
