import 'package:auto_route/auto_route.dart';
import 'package:dashboard_task/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:dashboard_task/core/constants/path.dart';
import 'package:dashboard_task/data/constant%20data/card_data.dart';
import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/add_card.dart';
import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/chart_widget.dart';
import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/drawer-widget.dart';
import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/header.dart';
import 'package:dashboard_task/presentation/widgets/components/responsivedashboard/component/mycard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';
import '../../components/responsivedashboard/component/transaction_table.dart';

class DesktopDashboard extends StatefulWidget {
  const DesktopDashboard({Key? key}) : super(key: key);

  @override
  State<DesktopDashboard> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopDashboard> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listenWhen: (previous, current) => current is DashboardActionState,
      buildWhen: (previous, current) => current is! DashboardActionState,
      listener: (context, state) {
       if(state is DashboardSuccessState){
        context.router.pushNamed('/');
       }
      },
      builder: (context, state) {
        if(state is DashboardInitialState){
        return Scaffold(
          backgroundColor: white,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // open drawer
              Expanded(child: DrawerWidget(
                onpressed: () {
                  BlocProvider.of<DashboardBloc>(context)
                      .add(DashboardLogoutEvent());
                },
              )),

              // first half of page
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    // header
                    const Header(),
                    // first 4 boxes in card
                    SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: cardData.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,
                                childAspectRatio: 2),
                        itemBuilder: (context, index) {
                          return MyBox(
                            details: cardData[index],
                          );
                        },
                      ),
                    ),

                    // list of chart and table
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
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
                                const Expanded(
                                    child: SingleChildScrollView(
                                  child: TransactionTable(),
                                )),
                              ],
                            ),
                          ),
                          // Add card section
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: white,
                                    ),
                                    child: Image.asset(
                                      Paths.cardimage,
                                      height: 200,
                                      width: 350,
                                    ),
                                  ),
                                ),
                                // second half of page
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 500,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: white,
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 2,
                                                blurStyle: BlurStyle.outer)
                                          ]),
                                      child: const TransactionDetails(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        }
        else{
          return const SizedBox(height: 5,);
        }
      },
    );
  }
}
