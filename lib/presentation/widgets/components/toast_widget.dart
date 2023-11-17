import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

Widget showToast(message){
  return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: secondPrimaryColor,
        ),
        child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            const Icon(Icons.error_outline),
            const SizedBox(
            width: 12.0,
            ),
            Text(message,style: const TextStyle(color: white),),
        ],
        ),
    );
 }