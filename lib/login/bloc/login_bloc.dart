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


  _onSendCodeEvent(SendCodeEvent event,Emitter<LoginState> emit) async{
    if(state.status == LoginStatus.codeSent){
      return;
    }
    if(state.phone.isNotEmpty){
      emit(state.copyWith(status: LoginStatus.codeSent));
      await Future.delayed(Duration(seconds: 10),(){});
      emit(state.copyWith(status: LoginStatus.initial));
    }else{
      emit(state.copyWith(status: LoginStatus.phoneError));
    }
  }

  _onCodeChangedEvent(CodeChangedEvent event,Emitter<LoginState> emit){
    if(state.code.isNotEmpty){
      emit(state.copyWith(status: LoginStatus.codeError,code: event.code));
    }else{
      emit(state.copyWith(status: LoginStatus.codeError,code: event.code));
    }
  }

  _onPhoneChangedEvent(PhoneChangedEvent event,Emitter<LoginState> emit){
    if(state.code.isNotEmpty){
      emit(state.copyWith(status: LoginStatus.codeError,phone: event.phone));
    }else{
      emit(state.copyWith(status: LoginStatus.phoneError,phone: event.phone));
    }
  }

  _onLoginSubmitEvent(LoginSubmitEvent event,Emitter<LoginState> emit) async{
    print('state.phone ${state.phone}state.code ${state.code}',);
    if(state.phone == '123' && state.code == '123'){
      emit(state.copyWith(status: LoginStatus.submitProgress));

      await Future.delayed(Duration(seconds: 2),(){});
      // emit(state.copyWith(status: LoginStatus.submitSuccess));
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(status: LoginStatus.initial));
      // globalBloc.emit(GlobalState(userInfo: User(phone: state.phone,status: UserStatus.login,id: '23')));
      globalBloc.add(LoginSuccess(User(phone: state.phone,status: UserStatus.login,id: '23')));

    }else{
      emit(state.copyWith(status: LoginStatus.submitProgress));
      await Future.delayed(Duration(seconds: 2),(){});
      emit(state.copyWith(status: LoginStatus.submitFailed));
    }
  }

}
