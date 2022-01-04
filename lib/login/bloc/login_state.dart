part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String phone;
  final String code;
  final LoginStatus status;
  final int time;
  LoginState({this.phone = '',  this.code='', this.status = LoginStatus.initial,this.time =0});

  LoginState copyWith({
    LoginStatus? status,
    String? phone,
    String? code,
    int? time
  }) {
    return LoginState(
      status: status ?? this.status,
      phone: phone ?? this.phone,
      code: code ?? this.code,
      time: time ?? this.time
    );
  }
  @override
  List<Object> get props => [phone,code,status,time];
}

enum LoginStatus{initial,submitProgress,submitSuccess,submitFailed,disSend,disSubmit}

