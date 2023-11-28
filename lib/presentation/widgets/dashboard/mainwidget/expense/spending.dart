import 'package:dashboard_task/data/constant%20data/spendingdata.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/mainwidget/expense/spendingcard.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../component/header.dart';


class Myspendings extends StatelessWidget {
  final String screen;
  const Myspendings({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          screen=='desktop'? 
                const Header():const SizedBox(height: 2,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text("Spendings",
                      style: TextStyle(
                          color: darkBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
           getcard(screen),
        ]),
      ),
    );
  }
   Widget getcard(screen){
    switch (screen) {
      case 'mobile':
      return
         Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: GridView.builder(
              itemCount: spendingdata.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, crossAxisSpacing: 10, childAspectRatio: 1.8),
              itemBuilder: (context, index) {
                return SpendingCardDetails(detail: spendingdata[index],);
              },
            ),
          );
      case 'Tablet':
          return
            Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: GridView.builder(
              itemCount: spendingdata.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, childAspectRatio: 1.8),
              itemBuilder: (context, index) {
                return SpendingCardDetails(detail: spendingdata[index],);
              },
            ),
          );
        
      default:
        return 
        Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: GridView.builder(
              itemCount: spendingdata.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, childAspectRatio: 1.8),
              itemBuilder: (context, index) {
                return SpendingCardDetails(detail: spendingdata[index],);
              },
            ),
          );
           

    }

  }
}
