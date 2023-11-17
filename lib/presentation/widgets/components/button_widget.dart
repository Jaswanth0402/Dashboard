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
        ElevatedButton(onPressed: onpressed,style: ElevatedButton.styleFrom(minimumSize: Size(MediaQuery.of(context).size.width*0.45,MediaQuery.of(context).size.height*0.07)), child:Text(value!),)
      ],
    );
  }
}