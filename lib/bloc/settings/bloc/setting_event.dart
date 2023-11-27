part of 'setting_bloc.dart';

@immutable
sealed class SettingEvent {}

final class SettingDrawerSelectEvent extends SettingEvent{
  final SettingItem item;

  SettingDrawerSelectEvent({required this.item});
}

