import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:dashboard_task/core/constants/string.dart';
import 'package:dashboard_task/core/utils/firebase/firebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupOnLoadState(image:"")) {
   on<SignupOnSubmitEvent>(signupOnSubmitEvent);
   on<SignupLoginNavigateEvent>(signupLoginNavigateEvent);
   on<InsertProfileEvent>(insertProfile);
  }
final ImagePicker _picker = ImagePicker();

  FutureOr<void> signupOnSubmitEvent(SignupOnSubmitEvent event, Emitter<SignupState> emit) async{
    emit(SignupOnLoadState(image:""));
    try {
       // ignore: unused_local_variable
       var result =await FirebaseMethods.addUser(name: event.name, image: event.image, email: event.email, contact: event.contact, password: event.password);
       var response=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: event.email, password: event.password);
       if(response.user?.email!=null){
       emit(SignupSuccessState(message:result.message! ));
       }
    } catch (e) {
  
        emit(SignupErrorState(message: Strings.signuperror));
      
    }
   
    
  }
FutureOr<void> insertProfile(InsertProfileEvent event, Emitter<SignupState> emit)async {   
   XFile? pickedFile = await _picker.pickImage(
    source: ImageSource.gallery,  
  );
  
  if(pickedFile !=null){
    Uint8List filePicked =await pickedFile.readAsBytes();
    var imageconvert = base64Encode(filePicked);
    
    emit(SignupOnLoadState(image:imageconvert));
  }
  
  }


  FutureOr<void> signupLoginNavigateEvent(SignupLoginNavigateEvent event, Emitter<SignupState> emit) {
    emit(SignupSuccessNavigateState());
  }
}
