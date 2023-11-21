import 'package:dashboard_task/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(color: primaryColor),
    );
  }
}