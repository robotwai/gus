part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];

}

class PhoneChangedEvent extends LoginEvent{
  final String phone;

  PhoneChangedEvent(this.phone);
  @override
  List<Object> get props => [phone];
}

class CodeChangedEvent extends LoginEvent{
  final String code;

  CodeChangedEvent(this.code);

  @override
  List<Object> get props => [code];
}

class SendCodeEvent extends LoginEvent{

  const SendCodeEvent();

}

class SendCodeTimeEvent extends LoginEvent{
  final int time;
  const SendCodeTimeEvent(this.time);

  @override
  List<Object> get props => [time];
}

class LoginSubmitEvent extends LoginEvent{

  const LoginSubmitEvent();
}