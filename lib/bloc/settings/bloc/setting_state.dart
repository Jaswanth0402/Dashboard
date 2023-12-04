part of 'setting_bloc.dart';

@immutable
sealed class SettingState {}

// ignore: must_be_immutable
final class SettingInitialState extends SettingState {
   SettingItem currentitem =SettingItems.accountsettings;

   SettingInitialState({ required this.currentitem});
}

final class ProfileLoadedState extends SettingState{
  final Stream<QuerySnapshot>user;
 
  ProfileLoadedState({required this.user});
}