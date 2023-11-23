import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/data/models/spending_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SpendingCardDetails extends StatelessWidget {
  final SpendingModel detail;
   SpendingCardDetails({super.key, required this.detail, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 6,
        shape: const RoundedRectangleBorder(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: 8),
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Your Spendings",
                style: TextStyle(color: purple,fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: 
                            PieChart(
                              PieChartData(
                                
                                sections: paiChartSelectionData,
                              ),
                            ),  
                        ),
                  ),
                  Expanded(child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Personal Care"),
                          Text(detail.personalcaremoney),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Electricity"),
                          Text(detail.electricitymoney),
                        ],
                        
                      ),

                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Food"),
                          Text(detail.foodmoney),
                        ],
                      ),
                       const SizedBox(height: 10,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total"),
                          Text(detail.totalmoney),
                        ],)
                    ]),
                  ))

                ],
              )
            ],
          ),
        ),
      ),
    );
    
  }
 late List<PieChartSectionData> paiChartSelectionData = [
  PieChartSectionData(
    color: secondPrimaryColor,
    value: detail.personalcarevalue,
    showTitle: false,
    radius: 15,
  ),
  PieChartSectionData(
    color: purple,
    value: detail.electricityvalue,
    showTitle: false,
    radius: 15,
  ),
  PieChartSectionData(
    color: darkYellow,
    value: detail.foodvalue,
    showTitle: false,
    radius: 15,
  ),
  
];
  
}
