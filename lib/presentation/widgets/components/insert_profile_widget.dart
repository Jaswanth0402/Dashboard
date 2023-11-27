import 'dart:convert';

import 'package:dashboard_task/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:dashboard_task/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


class ImageProfile extends StatelessWidget {
  final String? image;
  const ImageProfile({super.key, this.image});
  
   
  @override
  Widget build(BuildContext context) {
    
    
    return Center(
      child: Stack(
        children: [
          ClipOval(
              child: image != null
                  ? Image.memory(
                      base64Decode(image!),
                      fit: BoxFit.cover,
                      width: 95.0,
                      height: 95.0,
                    )
                  : Image.asset("image/profile.png",
                      fit: BoxFit.cover, width: 95.0, height: 95.0)),
         
        ],
      ),
    );
  }
}

// Widget bottomSheet(context) {
//   return Container(
//     height: 75.0,
//     width: MediaQuery.of(context).size.width,
//     margin: const EdgeInsets.symmetric(
//       horizontal: 20,
//       vertical: 20,
//     ),
//     child: Column(
//       children: <Widget>[
//         const Text(
//           "Choose Profile photo",
//           style: TextStyle(
//             fontSize: 20.0,
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               ElevatedButton.icon(
//                 icon: const Icon(Icons.camera),
//                 onPressed: () {
//                   // takePhoto(ImageSource.camera);
//                 },
//                 label: const Text("Camera"),
//               ),
//               ElevatedButton.icon(
//                 icon: const Icon(Icons.image),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 label: const Text("Gallery"),
//               ),
//             ])
//       ],
//     ),
//   );
// }
