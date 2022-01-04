
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gus/common/bloc/common_bloc.dart';
import 'package:flutter_gus/global/global_bloc.dart';

abstract class CommonPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: BlocBuilder<CommonBloc,CommonState>(
        builder: (context,commonState){
          return BlocBuilder<GlobalBloc,GlobalState>(
            builder: (context,state){
              Widget res = LoaingPage();
              switch(commonState.pageStatus){
                case PageStatus.Failed:
                  res = FailedPage();
                  break;
                case PageStatus.Empty:
                  res = EmptyPage();
                  break;
                case PageStatus.Success:
                  res = buildBody(commonState.data);
                  break;
                case PageStatus.Loading:
                  break;
              }
              return Container(
                color: state.deviceType==DeviceType.phone?Colors.yellow:Colors.white,
                child: res,
              );
            });
        },
      ),
    );
  }

  PreferredSizeWidget appbar(){
    return AppBar(title: Text('title'),);
  }

  Widget buildBody(String? data);
}


class EmptyPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('this is Empty'),
      ),
    );
  }
}

class FailedPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
          child:  Container(
            color: Colors.red,
            width: 100,
            height: 100,
            child: Text('failed retry'),
          ),
          onTap: (){
            context.read<CommonBloc>().add(PageReload());
          },
        ),
      ),
    );
  }
}


class LoaingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}