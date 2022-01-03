import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gus/detail/detail_page.dart';
import 'package:flutter_gus/global/global_bloc.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: BlocBuilder<GlobalBloc,GlobalState>(
        buildWhen: (previous, current) => previous.deviceType != current.deviceType,
        builder: (context,state){
          return Center(
            child: Column(
              children: [
                state.deviceType==DeviceType.phone?Text('Home Phone'):Text('Home PDA'),
                GestureDetector(
                  child:  Text('change type'),
                  onTap: (){
                    context.read<GlobalBloc>().add(DevicesStateChanged(state.deviceType==DeviceType.phone?DeviceType.pda:DeviceType.phone));
                  },
                ),
                GestureDetector(
                  child:  Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                    child: Text('jump to detail'),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (c,){
                      return DetailPage();
                    }));
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}


class SplashPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Splash'),),
      body: Center(
        child: Text('SplashPage'),
      ),
    );
  }
}

class ClosePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('close'),),
      body: Center(
        child: Text('ClosePage'),
      ),
    );
  }
}