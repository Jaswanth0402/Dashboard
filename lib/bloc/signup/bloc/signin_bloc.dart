import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dashboard_task/core/constants/string.dart';
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
       if(response.user?.email!=null){
       emit(SignupSuccessState());
       }
    } catch (e) {
  
        emit(SignupErrorState(message: Strings.signuperror));
      
    }
   
    
  }



  FutureOr<void> signupLoginNavigateEvent(SignupLoginNavigateEvent event, Emitter<SignupState> emit) {
    emit(SignupSuccessState());
  }
}
