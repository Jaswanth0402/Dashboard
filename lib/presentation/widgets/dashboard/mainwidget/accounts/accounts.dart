import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/data/constant%20data/accountdata.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/component/header.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/mainwidget/accounts/carddetail.dart';
import 'package:flutter/material.dart';


class AccountWidget extends StatefulWidget {
  final String screen;
  const AccountWidget({super.key, required this.screen});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  Widget build(BuildContext contexta) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              widget.screen=='mobile'? const SizedBox(height: 2,)
                :const Header(),
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
                
                    widget.screen =='mobile'?
                     Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              child: GridView.builder(
                itemCount: accountData.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, crossAxisSpacing: 10, childAspectRatio: 2.8),
                itemBuilder: (context,index) {
                  return  CardDetails(
                   
                    details: accountData[index],
                  );
                },
              ),
            ):
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
            )
          
                    ]),
      ),
    );
  }
}
