import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/drawer-widget.dart';
import 'package:dashboard_task/presentation/widgets/components/search_field.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/path.dart';
import '../../../../core/constants/string.dart';
import '../../../../core/utils/colors.dart';
import '../../../../data/constant data/card_data.dart';
import '../../components/responsivedashboard/component/add_card.dart';
import '../../components/responsivedashboard/component/chart_widget.dart';
import '../../components/responsivedashboard/component/mycard.dart';
import '../../components/responsivedashboard/component/transaction_table.dart';

class TabletDashboard extends StatefulWidget {
  const TabletDashboard({super.key});

  @override
  State<TabletDashboard> createState() => _TabletDashboardState();
}

class _TabletDashboardState extends State<TabletDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: darkBlack,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text(
          Strings.dashboard,
          style: TextStyle(color: darkBlack),
        ),
        actions: const [
          Padding(padding: EdgeInsets.all(5), child: SearchFormField()),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.notifications,
            color: darkBlack,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: white,
      ),
      backgroundColor: white,
      drawer: DrawerWidget(
        onpressed: () {},
      ),
      body: SafeArea(
          child: Container(
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
                                borderRadius: BorderRadius.circular(8),
                                color: lightgray),
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
                                    BoxShadow(
                                        blurRadius: 2, blurStyle: BlurStyle.outer)
                                  ]),
                              child: const TransactionDetails(),
                            ),
                          ),
                        ),
                     ],
                        ),
              
            
          ]),
        ),
      )),
    );
  }
}
