import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/presentation/widgets/components/insert_profile_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/constants/string.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height*0.5,
    
      child:  const Column(
        children: [
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 ImageProfile(),
                 SizedBox(
                  height: 20,
                ),
                 Text(
                  Strings.profilename,
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),
                )
            ],
          )),
           Expanded(child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Email",
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Text("jgjaswanthjk6@gmail.com",
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),)
                ],
              ),
              
              Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Password",
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                  Text("Logan0402@",
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Contact",
                  style: TextStyle(
                      color: white, fontSize: 15, fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                  Text("6374884174",
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