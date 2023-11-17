import 'package:dashboard_task/core/constants/string.dart';
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
                Strings.addcard,
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
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              Strings.currenttotal,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 6,
            ),
            Text(Strings.amoutcard2,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(Strings.lastTransaction),
            SizedBox(
              height: 8,
            ),
            LastTransaction(
                icons: Icons.smart_display_rounded,
                title: Strings.figma,
                amount: Strings.amoutcard3),
            SizedBox(
              height: 8,
            ),
            LastTransaction(
                icons: Icons.add_business_outlined,
                title:Strings.dribble,
                amount:Strings.amoutcard4),
            SizedBox(
              height: 8,
            ),
            LastTransaction(
                icons: Icons.access_alarm_outlined,
                title: Strings.agency,
                amount: Strings.amoutcard4)
          ]),
        ),
      ],
    );
  }
}
