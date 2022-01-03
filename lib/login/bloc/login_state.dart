part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String phone;
  final String code;
  final LoginStatus status;
  LoginState({this.phone = '',  this.code='', this.status = LoginStatus.initial});

  LoginState copyWith({
    LoginStatus? status,
    String? phone,
    String? code,
  }) {
    return LoginState(
      status: status ?? this.status,
      phone: phone ?? this.phone,
      code: code ?? this.code,
    );
  }
  @override
  List<Object> get props => [phone,code,status];
}

enum LoginStatus{initial,submitProgress,submitSuccess,submitFailed,codeSent,phoneError,codeError}

