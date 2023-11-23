import 'package:dashboard_task/data/constant%20data/spendingdata.dart';
import 'package:dashboard_task/presentation/widgets/dashboard/mainwidget/expense/spendingcard.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../component/header.dart';


class Myspendings extends StatelessWidget {
  const Myspendings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Header(),
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
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: GridView.builder(
            itemCount: spendingdata.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 10, childAspectRatio: 2),
            itemBuilder: (context, index) {
              return SpendingCardDetails(detail: spendingdata[index],);
            },
          ),
        ),
      ]),
    );
  }
}
