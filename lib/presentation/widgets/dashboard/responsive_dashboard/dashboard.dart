import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/add_card.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/path.dart';
import '../../../../core/utils/colors.dart';
import '../../../../data/constant data/card_data.dart';
import '../../components/responsivedashboard/component/chart_widget.dart';
import '../../components/responsivedashboard/component/header.dart';
import '../../components/responsivedashboard/component/mycard.dart';
import '../../components/responsivedashboard/component/transaction_table.dart';

class DashboardSide extends StatelessWidget {
  final String screen;
  const DashboardSide({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(0),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(children: [
          screen == 'desktop'
              ? const Header()
              : const SizedBox(
                  height: 2,
                ),
          Container(
            padding: const EdgeInsets.all(0.1),
            width: double.infinity,
            child: GridView.builder(
              itemCount: cardData.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 10, childAspectRatio: 2),
              itemBuilder: (context, index) {
                return MyBox(
                  details: cardData[index],
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        //card Area
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: lightgray),
                          child: const ChartScreen(),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: const TransactionTable()),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
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
                      Padding(
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
                                BoxShadow(
                                    blurRadius: 2, blurStyle: BlurStyle.outer)
                              ]),
                          child: const TransactionDetails(),
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ]),
      ),
    ));
  }
}
