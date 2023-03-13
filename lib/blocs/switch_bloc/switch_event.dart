part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}
//https://youtu.be/PD0eAXLd5ls?t=4225

class SwitchOnEvent extends SwitchEvent {}

class SwitchOffEvent extends SwitchEvent {}
