import 'package:dashboard_task/bloc/signup/bloc/signin_bloc.dart';
import 'package:dashboard_task/core/constants/string.dart';
import 'package:dashboard_task/core/utils/colors.dart';
import 'package:dashboard_task/presentation/widgets/components/button_widget.dart';
import 'package:dashboard_task/presentation/widgets/components/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/path.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  Future<bool> authenticate() async {
    if (_key.currentState!.validate()) {
      BlocProvider.of<SignupBloc>(context).add(SignupOnSubmitEvent(
          email: email.text, password: password.text, name: name.text));

      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Paths.backgroundimage), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 600,
                      child: Form(
                          key: _key,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 90),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  Strings.signup,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: lightBlueAccent,
                                      fontSize: 30,
                                      fontStyle: FontStyle.normal),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InputWidget(
                                  textInputAction: TextInputAction.next,
                                  editTextType: Strings.name,
                                  titles: Strings.name,
                                  prefixIcons: const Icon(
                                    Icons.info_outline,
                                    color: lightBlueAccent,
                                    size: 16,
                                  ),
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  autofocus: true,
                                  controller: name,
                                  hintText: Strings.name,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InputWidget(
                                  textInputAction: TextInputAction.next,
                                  editTextType: Strings.email,
                                  titles: Strings.email,
                                  prefixIcons: const Icon(
                                    Icons.email_outlined,
                                    color: lightBlueAccent,
                                    size: 16,
                                  ),
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  autofocus: false,
                                  controller: email,
                                  hintText: Strings.email,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InputWidget(
                                  textInputAction: TextInputAction.next,
                                  editTextType: Strings.mobile,
                                  titles: Strings.mobile,
                                  prefixIcons: const Icon(
                                    Icons.mobile_friendly_outlined,
                                    color: lightBlueAccent,
                                    size: 16,
                                  ),
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  autofocus: true,
                                  controller: mobile,
                                  hintText: Strings.mobile,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InputWidget(
                                  textInputAction: TextInputAction.done,
                                  editTextType: Strings.password,
                                  titles: Strings.password,
                                  prefixIcons: const Icon(
                                    Icons.lock_clock_outlined,
                                    color: lightBlueAccent,
                                    size: 16,
                                  ),
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: password,
                                  hintText: Strings.password,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ButtonWidget(
                                  onpressed: authenticate,
                                  value: Strings.signup,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      Strings.haveaccount,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color: white),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<SignupBloc>(context)
                                            .add(SignupLoginNavigateEvent());
                                      },
                                      child: const Text(
                                        Strings.login,
                                        textAlign: TextAlign.end,
                                        style:
                                            TextStyle(color: lightBlueAccent),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
