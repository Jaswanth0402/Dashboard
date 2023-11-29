import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/core/utils/firebase/firebase_methods.dart';
import 'package:dashboard_task/presentation/widgets/components/insert_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  Stream<QuerySnapshot>? user;
  String? email;
  Future<String> instance() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var email = preferences.get('email');
    return email.toString();
  }

  void convert() async {
    var response = instance();
    String result = await response;
    setState(() {
      email = result;
      user = FirebaseMethods.getUser(email: email);
    });
  }

  @override
  void initState() {
    convert();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: snapshot.data!.docs.map((e) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          subtitle: Container(
                            child: Column(children: [
                              ImageProfile(
                                  image: e.data().toString().contains('image')
                                      ? e['image']
                                      : ''),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                e.data().toString().contains('username')

                                    ? e['username']
                                    : '',
                                style: const TextStyle(
                                    color: darkBlack,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Email",
                                        style: TextStyle(
                                            color: darkBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        e.data().toString().contains('email')
                                            ? e['email']
                                            : '',
                                        style: const TextStyle(
                                            color: darkBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Password",
                                        style: TextStyle(
                                            color: darkBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        e.data().toString().contains('password')
                                            ? e['password']
                                            : '',
                                        style: const TextStyle(
                                            color: darkBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Contact",
                                        style: TextStyle(
                                            color: darkBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        e.data()
                                         .toString()
                                         .contains('contact_no')
                                            ? e['contact_no']
                                            : '',
                                        style: const TextStyle(
                                            color: darkBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          } else {
            return const SizedBox(
              height: 7,
            );
          }
        });
  }
}

