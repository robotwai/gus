import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_gus/global/user.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  late User userInfo;
  GlobalBloc() : super(GlobalState(User())) {
    on<DevicesStateChanged>(_onDeviceTypeChange);
    on<LoginSuccess>(_onLoginSuccess);
    on<Logout>(_onLogout);
    init();
    // ignore: invalid_use_of_visible_for_testing_member
  }

  init()async {
    userInfo = User();
    await Future<void>.delayed(const Duration(seconds: 1));
    User user = User();
    user.status = UserStatus.unLogin;
    emit(GlobalState(user));

  }

  _onDeviceTypeChange(DevicesStateChanged event,Emitter<GlobalState> emit){
    emit(GlobalState(userInfo,deviceType: event.deviceType));
  }

  _onLoginSuccess(LoginSuccess event, Emitter<GlobalState> emit){
    userInfo = event.userinfo;
    emit(GlobalState(event.userinfo,));
  }

  _onLogout(Logout event, Emitter<GlobalState> emit){
    emit(GlobalState(event.userinfo,));
  }

}
