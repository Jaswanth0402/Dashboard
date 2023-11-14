import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
                  image: AssetImage('image/back2.jpeg'), fit: BoxFit.fill),
        ),
        child: const Center(
          child: CircularProgressIndicator(color:lightBlueAccent,),
        ),
      ),
    );
  }
}
