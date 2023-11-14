import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupOnLoadState()) {
   on<SignupOnSubmitEvent>(signupOnSubmitEvent);
   on<SignupLoginNavigateEvent>(signupLoginNavigateEvent);
  }

  FutureOr<void> signupOnSubmitEvent(SignupOnSubmitEvent event, Emitter<SignupState> emit) async{
    emit(SignupOnLoadState());
    try {
       var response=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: event.email, password: event.password);
       // ignore: avoid_print
       print(response.user?.displayName);
       emit(SignupSuccessState());
    } catch (e) {
      // ignore: avoid_print
      print("Error:$e");
        emit(SignupErrorState(message: e.toString()));
      
    }
   
    
  }



  FutureOr<void> signupLoginNavigateEvent(SignupLoginNavigateEvent event, Emitter<SignupState> emit) {
    emit(SignupSuccessState());
  }
}
