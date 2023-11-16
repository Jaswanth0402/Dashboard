import 'package:dashboard_task/core/utils/colors.dart';
import 'package:flutter/material.dart';

import 'histroy_trans.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 80,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: darkGrey,
              ),
              label: const Text(
                "Add card",
                style: TextStyle(color: darkGrey),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: white,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                          color: darkGrey))),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Current Total",
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 6,
              ),
              Text("24000",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Last Transaction"),
          SizedBox(
            height: 10,
          ),
          LastTransaction(
              icons: Icons.smart_display_rounded,
              title: "Figma subscription",
              amount: '12000'),
          SizedBox(
            height: 10,
          ),
          LastTransaction(
              icons: Icons.add_business_outlined,
              title: "Dribble business",
              amount: "400"),
          SizedBox(
            height: 10,
          ),
          LastTransaction(
              icons: Icons.access_alarm_outlined,
              title: "Agency salary",
              amount: "400")
        ]),
      ],
    );
  }
}
