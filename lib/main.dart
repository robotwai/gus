import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gus/global/global_bloc.dart';
import 'package:flutter_gus/home/home_page.dart';
import 'package:flutter_gus/login/bloc/login_bloc.dart';
import 'package:flutter_gus/global/user.dart';

import 'login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GlobalBloc(),
      child: AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  State createState() {
    return _AppViewState();
  }
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<GlobalBloc, GlobalState>(
          listenWhen: (previous, current) =>
              previous.userInfo != current.userInfo,
          listener: (context, state) {
            switch (state.userInfo.status) {
              case UserStatus.login:
                _navigator.pushAndRemoveUntil(
                    MaterialPageRoute<void>(builder: (_) => HomePage()),
                    (route) => false);
                break;
              case UserStatus.close:
                _navigator.pushAndRemoveUntil(
                    MaterialPageRoute<void>(builder: (_) => ClosePage()),
                    (route) => false);
                break;
              default:
                _navigator.pushAndRemoveUntil(
                    MaterialPageRoute<void>(builder: (_) => LoginPage()),
                    (route) => false);
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) =>
          MaterialPageRoute<void>(builder: (_) => SplashPage()),
    );
  }
}
