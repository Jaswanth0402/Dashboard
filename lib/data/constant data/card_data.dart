import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/data/models/card_modal.dart';
import 'package:flutter/material.dart';

import '../../core/constants/string.dart';

List cardData = [
  CardDataModel(
      icon: Icons.notes_outlined,
      title: Strings.card1,
      money: "Rs 24000",
      backcolor: lightchoco),
  CardDataModel(
      icon: Icons.equalizer_outlined,
      title: Strings.card2,
      money: "Rs 2400",
      backcolor: lightblue),
  CardDataModel(
      icon: Icons.house_outlined,
      title: Strings.card3,
      money: "Rs 400",
      backcolor: lightpink),
  CardDataModel(
      icon: Icons.card_membership_outlined,
      title: Strings.card4,
      money: "Rs 44400",
      backcolor: lightyellow),
];
