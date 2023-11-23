import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/data/models/account_card.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  final AccountCardModel details;
  const CardDetails({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 6,
        shape: const RoundedRectangleBorder(),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.001,horizontal: 8),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            
            children: [
             
              const Text("State Bank Of India",style: TextStyle(color:darkGrey,fontWeight: FontWeight.bold),),
              const SizedBox(height: 3,),
              Container(
                color: details.backcolor,
                width: MediaQuery.of(context).size.width,
              
                
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Account Type",style: TextStyle(color:darkGrey,fontWeight: FontWeight.bold),),
                          Text(details.bank,style: const TextStyle(color:white,fontSize: 14,fontWeight: FontWeight.bold))
                        ],
                
                      ),
                      const SizedBox(height: 4,),
                       const Text("Credit Card",style: TextStyle(color:white,fontSize: 16,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 4,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(details.number,style: const TextStyle(color:darkGrey,fontWeight: FontWeight.bold)),
                                   Text(details.money,style: const TextStyle(color:white,fontWeight: FontWeight.bold)),
                                 ],
                               ),
                    ],
                  ),
                ),
              
              
              ),
            ],
          ),
        ),
      ),
    );
      
    
  }
}