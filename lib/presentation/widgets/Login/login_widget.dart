import 'package:dashboard_task/core/constants/string.dart';
import 'package:dashboard_task/presentation/widgets/components/button_widget.dart';
import 'package:dashboard_task/presentation/widgets/components/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login/bloc/login_bloc.dart';
import '../../../core/utils/colors.dart';
import '../../pages/signup/signup_page.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  
  Future<bool> authenticate()async{
    if (_key.currentState!.validate()) {
      BlocProvider.of<LoginBloc>(context).add(
        LoginOnSubmitEvent(
          email: email.text,
          password: password.text,
        ),
      );
      
      return true;

    }
    email.clear();
      password.clear();
      return false;

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 410),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('image/back2.jpeg'), fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Form(
                          key: _key,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 100),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  Strings.login,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color:lightBlueAccent,
                                      fontSize: 30,
                                      fontStyle: FontStyle.normal),
                                ),
                                const SizedBox(
                                  height: 20,
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
                                    color:lightBlueAccent,
                                    size: 16,
                                  ),
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  autofocus: true,
                                  controller: email,
                                  hintText: Strings.email,
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
                                    color:lightBlueAccent,
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                        onTap: () {},
                                        child: const Text(
                                          Strings.forgot,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: lightBlueAccent),
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ButtonWidget(
                                  onpressed: authenticate,
                                  value: Strings.login,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      Strings.account,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color:white),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<LoginBloc>(context).add(LoginSignupNavigateEvent());
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupPage()));
                                      },
                                      child: const Text(
                                        Strings.signup,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color:lightBlueAccent),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      
  
  }
}
