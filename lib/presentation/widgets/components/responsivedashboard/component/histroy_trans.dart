import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class LastTransaction extends StatelessWidget {
  final IconData icons;
  final String title;
  final String amount;
  const LastTransaction(
      {super.key,
      required this.icons,
      required this.title,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:white,
          boxShadow: const [
            BoxShadow(blurRadius: 1, blurStyle: BlurStyle.outer)
          ]),
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icons),
            Text(title),
            Text(amount)
          ]),
    );
  }
}
