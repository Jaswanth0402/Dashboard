

import 'package:dashboard_task/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/dashboard/bloc/dashboard_bloc.dart';


// ignore: non_constant_identifier_names
Widget LogoutAlert(BuildContext context){
  return AlertDialog(
        title: const Text('Are you sure?'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('We will be redirected to login page.'),
            ],
          ),
        ),
        actions: <Widget>[
  ElevatedButton(
    onPressed: () {
      Navigator.of(context).pop(); // Dismiss the Dialog
    },
    style: ElevatedButton.styleFrom(backgroundColor: secondPrimaryColor),
    child: const Text('No'),
   ),
   ElevatedButton(
    onPressed: () {
      BlocProvider.of<DashboardBloc>(context)
                          .add(DashboardLogoutEvent()); // Navigate to login
      // dashboardBloc.add(DashboardLogoutEvent());
    },
    style: ElevatedButton.styleFrom(backgroundColor: green),
    child: const Text('Yes'),
    ),
        ],
      );
}