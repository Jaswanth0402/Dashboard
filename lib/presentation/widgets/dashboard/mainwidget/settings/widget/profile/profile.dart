import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/core/utils/firebase/firebase_methods.dart';
import 'package:dashboard_task/data/models/user_model.dart';
import 'package:dashboard_task/presentation/widgets/components/insert_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../core/constants/string.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {

String? email;
UserModal? userdetails;
Future<String>instance()async{
   SharedPreferences preferences =await SharedPreferences.getInstance();
    email = preferences.get("email").toString();
    print(email);
    return email.toString();
}
  @override
  void initState(){
   var response = instance();
   
   if(response!=null){
   dynamic  user = FirebaseMethods.getUser(email:email);
    
       userdetails =user;
    
   }
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height*0.5,
      decoration: const BoxDecoration(color: darkGrey),
      child:  Row(
        children: [
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 ImageProfile(image: userdetails?.image,),
                 const SizedBox(
                  height: 20,
                ),
                 const Text(
                  Strings.profilename,
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),
                )
            ],
          )),
           Expanded(child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Text("Email",
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),),
                  const SizedBox(width: 10,),
                  Text(userdetails!.email,
                  style: const TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),)
                ],
              ),
              
              const Row(
                children: [
                  Text("Password",
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                  Text("jgjaswanthjk6@gmail.com",
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),)
                ],
              ),
              const Row(
                children: [
                  Text("Contact",
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                  Text("jgjaswanthjk6@gmail.com",
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),)
                ],
              )

            ],
          ) )
        ],
      ),
    );
  }
}