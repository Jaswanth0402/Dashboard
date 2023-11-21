import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitialState()) {
    on<DashboardLogoutEvent>(dashboardLogoutEvent);
    on<DashboardInsertProfileEvent>(insertProfile);
    
  }
final ImagePicker _picker = ImagePicker();

  FutureOr<void> dashboardLogoutEvent(DashboardLogoutEvent event, Emitter<DashboardState> emit) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    emit(DashboardOnLoadLogoutState());
    try {
      emit(DashboardInitialState());
       FirebaseAuth.instance.signOut();
       preferences.clear();
       emit(DashboardSuccessState());  
      
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  FutureOr<void> insertProfile(DashboardInsertProfileEvent event, Emitter<DashboardState> emit)async {
   SharedPreferences preferences =await SharedPreferences.getInstance();
    emit(DashboardOnLoadProfileState());
    
     emit(DashboardInitialState());
   XFile? pickedFile = await _picker.pickImage(
    source: ImageSource.gallery,  
  );
  
  if(pickedFile !=null){
    Uint8List filePicked =await pickedFile.readAsBytes();
    var imageconvert = base64Encode(filePicked);
    preferences.setString("image",imageconvert);
    
    var image =preferences.getString('image');
    emit(DashboardSuccessProfileState(image: image!));
  }
  
  }
}
