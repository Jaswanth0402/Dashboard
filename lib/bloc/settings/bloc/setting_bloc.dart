import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/firebase/firebase_methods.dart';
import '../../../data/models/setting.dart';
import '../../../presentation/widgets/dashboard/mainwidget/settings/settings.dart';


part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitialState(currentitem: SettingItems.profile)) {
   on<SettingDrawerSelectEvent>(drawerEvent);
   on<ProfileLoadEvent>(profileLoadEvent);
  }

  FutureOr<void> drawerEvent(SettingDrawerSelectEvent event, Emitter<SettingState> emit) {
    emit(SettingInitialState(currentitem: event.item));
  }

  FutureOr<void> profileLoadEvent(ProfileLoadEvent event, Emitter<SettingState> emit) async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
      Stream<QuerySnapshot>? user;
    var email = preferences.get('email').toString();
    user = FirebaseMethods.getUser(email: email);
    emit(ProfileLoadedState(user: user));
  }
}
