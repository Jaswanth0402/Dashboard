import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitialState()) {
    on<DashboardLogoutEvent>(dashboardLogoutEvent);
  }

  FutureOr<void> dashboardLogoutEvent(DashboardLogoutEvent event, Emitter<DashboardState> emit) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    emit(DashboardOnLoadLogoutState());
    try {
      emit(DashboardInitialState());
       FirebaseAuth.instance.signOut();
       preferences.clear();
       emit(DashboardSuccessState());  
      print('logout');
    } catch (e) {
      print(e);
    }
  }
}
