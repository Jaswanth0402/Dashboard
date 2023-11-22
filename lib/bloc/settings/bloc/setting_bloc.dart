import 'dart:async';
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import '../../../data/models/setting.dart';
import '../../../presentation/widgets/dashboard/mainwidget/settings/settings.dart';


part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitialState(currentitem: SettingItems.accountsettings)) {
   on<SettingDrawerSelectEvent>(drawerEvent);
  }

  FutureOr<void> drawerEvent(SettingDrawerSelectEvent event, Emitter<SettingState> emit) {
    emit(SettingInitialState(currentitem: event.item));
  }
}
