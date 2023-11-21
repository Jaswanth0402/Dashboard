import 'package:flutter/material.dart';
import '../../../../core/constants/string.dart';
import '../../../../core/utils/colors.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        //account details

        Container(
          padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(Strings.accountsettings,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(Strings.email,
                        style: TextStyle(fontWeight: FontWeight.w100)),
                    const SizedBox(
                      height: 3,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 34,
                      child: const TextField(
                        decoration: InputDecoration(
                            hintText: Strings.email,
                            border: OutlineInputBorder(gapPadding: 4.0),
                            focusedBorder: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 3)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(Strings.password,
                        style: TextStyle(fontWeight: FontWeight.w100)),
                    const SizedBox(
                      height: 3,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 34,
                      child: const TextField(
                        decoration: InputDecoration(
                            hintText: Strings.password,
                            border: OutlineInputBorder(gapPadding: 4.0),
                            focusedBorder: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 3)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: white),
                            child: const Text(
                              Strings.cancel,
                              style: TextStyle(color: darkBlack),
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: const Text(Strings.save))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                height: 150,
                decoration: const BoxDecoration(color: lightblue),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(Strings.requirepass),
                    SizedBox(
                      height: 4,
                    ),
                    Text(Strings.passcondition1),
                    SizedBox(
                      height: 4,
                    ),
                    Text(Strings.passcondition2),
                    SizedBox(
                      height: 4,
                    ),
                    Text(Strings.passcondition3),
                    SizedBox(
                      height: 4,
                    ),
                    Text(Strings.passcondition4),
                  ],
                ),
              )
            ],
          ),
        ),

        //code track

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(Strings.analytics,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  Strings.trackcode,
                  style:
                      TextStyle(fontWeight: FontWeight.w100, color: darkGrey),
                ),
                const SizedBox(
                  height: 3,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 34,
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: Strings.code,
                        border: OutlineInputBorder(gapPadding: 7.0),
                        focusedBorder: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 3)),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: lightBlueAccent,
                      size: 15,
                    ),
                    Text(
                      Strings.infotrack,
                      style: TextStyle(color: lightBlueAccent),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        //delete account

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                Strings.deleteacc,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(Strings.deleteoption),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 45),
                    backgroundColor: primaryColor),
                child: const Text(Strings.deleteacc),
              )
            ],
          ),
        )
      ],
    );
  }
}
