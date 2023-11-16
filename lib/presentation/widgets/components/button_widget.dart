import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? value;
  final VoidCallback? onpressed;
  const ButtonWidget({
  super.key,
  required this.value,
  required this.onpressed
  });
   
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        ElevatedButton(onPressed: onpressed,style:ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 205,vertical: 22)), child:Text(value!),)
      ],
    );
  }
}