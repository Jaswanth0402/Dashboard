
import 'package:flutter/material.dart';
import '../../../../core/constants/path.dart';
import '../../../../core/constants/string.dart';
import '../../../../core/utils/colors.dart';
import '../../../../data/constant data/card_data.dart';
import '../../../../data/models/sidebar_items.dart';
import '../../components/search_field.dart';
import '../component/add_card.dart';
import '../component/chart_widget.dart';
import '../component/drawer_widget.dart';
import '../component/mycard.dart';
import '../component/transaction_table.dart';

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({super.key});

  @override
  State<MobileDashboard> createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  SidebarItem currentSelecteditem =SidebarItems.accounts;
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
        // onpressed: () {
        //   BlocProvider.of<DashboardBloc>(context).add(DashboardLogoutEvent());
        // }, 
        currentitem: currentSelecteditem, onSelectedItems: (item) {  },
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
                    childAspectRatio: 1.5),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                    boxShadow: const [
                      BoxShadow(blurRadius: 2, blurStyle: BlurStyle.outer)
                    ]),
                child: const TransactionDetails(),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
