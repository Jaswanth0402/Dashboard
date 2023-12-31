import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/string.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginOnLoadState()) {
    on<LoginOnSubmitEvent>(loginOnSubmitEvent);
    on<LoginSignupNavigateEvent>(loginSignupNavigateEvent);
  }

  FutureOr<void> loginOnSubmitEvent(LoginOnSubmitEvent event, Emitter<LoginState> emit) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
      emit(LoginOnLoadState());
     
     try {
       var response =await FirebaseAuth.instance.signInWithEmailAndPassword(email: event.email, password: event.password);
     
        emit(LoginOnLoadLogoutState());
       if(response.user?.email != null){
       preferences.setString("email",response.user!.email.toString());
       emit(LoginSuccessState(message: Strings.loginsuccess,email: response.user?.email));
       }
     } catch (e) {
       // ignore: avoid_print
       emit(LoginErrorState(message: Strings.loginerror));
       
     }
  }

  FutureOr<void> loginSignupNavigateEvent(LoginSignupNavigateEvent event, Emitter<LoginState> emit) {
  
    emit(LoginSignupNavigateState());
  }
}
