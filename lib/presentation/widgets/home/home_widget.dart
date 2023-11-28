
import 'package:dashboard_task/bloc/home/bloc/home_bloc.dart';
import 'package:dashboard_task/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/string.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/home2.webp"), fit: BoxFit.cover),
        ),
        child:  Column(
          
          children: [
            Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
                   
                  ElevatedButton.icon(
                    onPressed: (){
                      BlocProvider.of<HomeBloc>(context).add(LoginNavigateEvent());
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,side: const BorderSide(color: blue)), icon: const Icon(Icons.login_outlined), label: const Text(Strings.login))
               
             ],
            ),
            const SizedBox(height: 180,),
             const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Financial Assitance \nWith True Purpose",softWrap: true,style: TextStyle(color: white,fontSize: 45,fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 6,
                        ),
                      Text("We know how large objects will act but \nthings on a small scale",style: TextStyle(color: darkGrey,fontSize: 20),)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}