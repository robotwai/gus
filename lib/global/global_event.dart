part of 'global_bloc.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();

  @override
  List<Object> get props => [];
}

class DevicesStateChanged extends GlobalEvent{
  final DeviceType deviceType;

  DevicesStateChanged(this.deviceType);

  @override
  List<Object> get props => [deviceType];
}

class LoginSuccess extends GlobalEvent{
  final User userinfo;

  LoginSuccess(this.userinfo);

  @override
  List<Object> get props => [userinfo];
}


enum DeviceType{phone,pda}