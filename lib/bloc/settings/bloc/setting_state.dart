part of 'setting_bloc.dart';

@immutable
sealed class SettingState {}

// ignore: must_be_immutable
final class SettingInitialState extends SettingState {
   SettingItem currentitem =SettingItems.accountsettings;

   SettingInitialState({ required this.currentitem});
}
