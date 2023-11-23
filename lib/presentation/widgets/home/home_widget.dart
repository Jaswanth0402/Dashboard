
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
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/home3.webp"), fit: BoxFit.fill),
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
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,side: BorderSide(color: blue)), icon: const Icon(Icons.login_outlined), label: const Text(Strings.login))
               
             ],
            ),
            SizedBox(height: 140,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 350,
                      child: Text("Financial Assitance With True Purpose",style: TextStyle(color: white,fontSize: 45,fontWeight: FontWeight.bold),)),
                      SizedBox(
                        height: 6,
                      ),
                    SizedBox(
                      
                      width: 350,
                      child: Text("We know how large objects will act but things on a small scale",style: TextStyle(color: darkGrey,fontSize: 20),))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}