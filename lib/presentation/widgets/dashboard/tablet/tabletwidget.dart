import 'package:flutter/material.dart';

import '../../../../core/constants/path.dart';
import '../../../../core/utils/colors.dart';
import '../../../../data/constant data/card_data.dart';
import '../component/add_card.dart';
import '../component/chart_widget.dart';
import '../component/mycard.dart';
import '../component/transaction_table.dart';

class TabletDashboardWidget extends StatelessWidget {
  const TabletDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.all(0),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(0.1),
                width: double.infinity,
                child: GridView.builder(
                  itemCount: cardData.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      childAspectRatio: 2),
                  itemBuilder: (context, index) {
                    return MyBox(
                      details: cardData[index],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                //cart Area
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: lightgray),
                  child: const ChartScreen(),
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: const TransactionTable()),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: white,
                      ),
                      child: Image.asset(
                        Paths.cardimage,
                        height: 300,
                        width: 350,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 310,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: white,
                            boxShadow: const [
                              BoxShadow(blurRadius: 2, blurStyle: BlurStyle.outer)
                            ]),
                        child: const TransactionDetails(),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
              ),
            );
  }
}