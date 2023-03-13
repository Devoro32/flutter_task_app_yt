part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  //https://youtu.be/PD0eAXLd5ls?t=4208
  final bool switchValue;

  const SwitchState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required bool switchValue})
      : super(switchValue: switchValue);
}
