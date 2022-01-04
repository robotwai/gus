import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_gus/global/global_bloc.dart';
import 'package:flutter_gus/global/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  GlobalBloc globalBloc;


  LoginBloc(this.globalBloc) : super(LoginState()) {
    on<SendCodeEvent>(_onSendCodeEvent);
    on<CodeChangedEvent>(_onCodeChangedEvent);
    on<PhoneChangedEvent>(_onPhoneChangedEvent);
    on<LoginSubmitEvent>(_onLoginSubmitEvent);
  }
  ///声明变量

  _onSendCodeEvent(SendCodeEvent event,Emitter<LoginState> emit) async{
    if(state.time!=0){
      return;
    }
    if(state.phone.isNotEmpty){
      int curentTimer = 10;

      while(curentTimer>0){
        await Future.delayed(Duration(seconds: 1));
        curentTimer -- ;
        emit(state.copyWith(time: curentTimer));
      }
    }
  }

  _onCodeChangedEvent(CodeChangedEvent event,Emitter<LoginState> emit){
    if(event.code.isEmpty||state.phone.isEmpty){
      if(state.phone.isEmpty){
        emit(state.copyWith(status: LoginStatus.disSend,code: event.code));
      }else{
        emit(state.copyWith(status: LoginStatus.disSubmit,code: event.code));
      }
    }else{
      emit(state.copyWith(code: event.code,status: LoginStatus.initial));
    }
  }


  _onPhoneChangedEvent(PhoneChangedEvent event,Emitter<LoginState> emit){
    if(state.code.isEmpty||event.phone.isEmpty){
      if(event.phone.isEmpty){
        emit(state.copyWith(status: LoginStatus.disSend,phone: event.phone));
      }else{
        emit(state.copyWith(status: LoginStatus.disSubmit,phone: event.phone));
      }
    }else{
      emit(state.copyWith(phone: event.phone,status: LoginStatus.initial));
    }
  }

  _onLoginSubmitEvent(LoginSubmitEvent event,Emitter<LoginState> emit) async{
    print('state.phone ${state.phone}state.code ${state.code}',);
    if(state.phone == '123' && state.code == '123'){
      emit(state.copyWith(status: LoginStatus.submitProgress));

      await Future.delayed(Duration(seconds: 2),(){});
      emit(state.copyWith(status: LoginStatus.initial));
      globalBloc.add(LoginSuccess(User(phone: state.phone,status: UserStatus.login,id: '23')));

    }else{
      emit(state.copyWith(status: LoginStatus.submitProgress));
      await Future.delayed(Duration(seconds: 2),(){});
      if(!isClosed){
        emit(state.copyWith(status: LoginStatus.submitFailed));
      }
    }
  }

}
